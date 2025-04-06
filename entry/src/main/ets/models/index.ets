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

export interface PageData<T> {
  total: number
  pageTotal: number
  rows: T[]
}

export enum SortType {
  Default = 0,
  DifficultyLow = 10,
  DifficultyHigh = 11,
  ViewLow = 20,
  ViewHigh = 21,
  Commend = 30
}

export interface QuestionListParams {
  type: number
  questionBankType: 9 | 10
  sort?: SortType
  page?: number
  pageSize?: number
}