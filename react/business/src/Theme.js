import { createMuiTheme } from '@material-ui/core/styles';

export const theme = createMuiTheme({
  "palette": {
    "common": {
      "black": "#000",
      "white": "#fff"
    },
    "background": {
      "light": "#FEFCDB",
      "default": "#fff"
    },
    "primary": {
      "main": "#D11149"
    },
    "accent": {
      "main":"#F17105"
    }
  },

  typography: {
    fontFamily: [
      '"Open Sans"', 
      'sans-serif',
    ].join(','),
  },
});

export default theme;