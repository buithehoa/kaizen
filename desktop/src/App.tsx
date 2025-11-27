import React from 'react';
import { CssBaseline, ThemeProvider, createTheme, Button, Container, Typography, Box } from '@mui/material';

// Create a dark theme instance (optional, but looks cool)
const darkTheme = createTheme({
  palette: {
    mode: 'dark',
  },
});

const App = () => {
  return (
    <ThemeProvider theme={darkTheme}>
      <CssBaseline /> {/* Normalizes CSS */}
      <Container maxWidth="sm">
        <Box sx={{ my: 4, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
          <Typography variant="h4" component="h1" gutterBottom>
            Electron + React + MUI
          </Typography>
          <Button variant="contained" color="primary">
            Hello World
          </Button>
        </Box>
      </Container>
    </ThemeProvider>
  );
};

export default App;

