import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { fullScreen, logger } from '../commons/utils';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    logger.info('Ability onCreate')
    AppStorage.setOrCreate('context', this.context)
  }

  onDestroy(): void {
    logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    logger.info('Ability onWindowStageCreate')
    fullScreen.enable()

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        logger.error(`Failed to load the content. Cause: ${JSON.stringify(err)}`)
        return;
      }
      logger.info('Succeeded in loading the content.')
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    logger.info('Ability onWindowStageDestroy')
  }

  onForeground(): void {
    // Ability has brought to foreground
    logger.info('Ability onForeground')
  }

  onBackground(): void {
    // Ability has back to background
    logger.info('Ability onBackground')
  }
}