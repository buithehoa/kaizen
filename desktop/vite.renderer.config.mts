import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react'; // Import the plugin

// https://vitejs.dev/config
export default defineConfig({
  plugins: [react()], // Add react() to the plugins array
});

