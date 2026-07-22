export interface Course {
  id: number;
  name: string;
  code: string;
  credits: number;
  gradeStatus: 'passed' | 'failed' | 'pending';
  level: 'Beginner' | 'Intermediate' | 'Advanced';
  price: number;
  startDate: Date;
  duration: number;
}