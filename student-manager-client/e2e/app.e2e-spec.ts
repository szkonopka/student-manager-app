import { StudentsManagerPage } from './app.po';

describe('students-manager App', function() {
  let page: StudentsManagerPage;

  beforeEach(() => {
    page = new StudentsManagerPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
