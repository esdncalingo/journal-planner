const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      keyframes: {
        slideDown: {
          "0%": {
            filter: "brightness(1.75);",
            transform: "translateY(-100%)",
          },
          "100%": {
            filter: "brightness(1);",
            transform: "translateY(0%)",
          },
        },
        scaleInRL: {
          "0%": {
            transform: "scaleX(0) rotate(0deg)",
          },
          "75%": {
            transform: "scale(1.2)",
          },
          "100%": {
            transform: "scaleX(1) rotate(-30deg)",
          },
        },
      },
      animation: {
        slideDown: "slideDown 250ms infinite",
        scaleInRL: "scaleInRL 0.75s cubic-bezier(0.250, 0.460, 0.450, 0.940) both",
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
