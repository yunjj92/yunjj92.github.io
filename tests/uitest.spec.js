import { test, expect } from '@playwright/test';

test('uitest', async ({ page }) => {
  await page.goto('http://127.0.0.1:4000/');
  await page.getByRole('link', { name: 'Explore Articles' }).click();
  await page.getByText('자바에서 람다 표현식 사용하기 일반적인 자바 람다식 표현 자바에서의 람다 표현식은 오직 추상 함수만 구현하기 때문에 함수적 역할을 수행하는 인터').click();
  await page.locator('div').filter({ hasText: 'Java' }).nth(4).click();
  await page.getByText('April 21, 2023 About DB Index').click();
  await page.getByText('May 25, 2023 shellscript in').click();
  await page.getByLabel('Main navigation').getByRole('link', { name: 'Blog' }).click();
  await page.getByText('July 31, 2023 Javadtovalidation 자바에서 DTO 클래스 Validation 체크하기 yunjj92').click();
  await page.getByRole('article').filter({ hasText: 'July 31, 2023 Javadtovalidation 자바에서 DTO 클래스 Validation 체크하기 yunjj92' }).click();
  await page.locator('div').filter({ hasText: 'March 20, 2023 Http Request' }).nth(4).click();
  await page.getByLabel('Main navigation').getByRole('link', { name: 'Projects' }).click();
  await page.getByRole('link', { name: 'Task Management Application' }).click();
  await page.getByLabel('Main navigation').getByRole('link', { name: 'About' }).click();
  await page.getByLabel('Main navigation').getByRole('link', { name: 'Home' }).click();
  await page.getByRole('link', { name: 'Read Article' }).nth(1).click();
  await expect(page.getByRole('link', { name: 'Read Article' })).toBeVisible();
});