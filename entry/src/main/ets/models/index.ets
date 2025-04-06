// 首页试题类别
export interface QuestionType {
  id: number
  name: string
  displayNewestFlag: 0 | 1
}

// 试题数据类型
export interface QuestionItem {
  id: string;
  stem: string; // 题干
  difficulty: number; // 难度
  likeCount: number; // 点赞数
  views: number; // 浏览数
  readFlag: 0 | 1; // 是否已看
}