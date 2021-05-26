import { render, screen } from '@testing-library/react';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/I can think! I can wait! I can fast!/i);
  expect(linkElement).toBeInTheDocument();
});
