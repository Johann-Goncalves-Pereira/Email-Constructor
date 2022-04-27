module.exports = {
  plugins: {
    doiuse: {},
    cssnano: {
      preset: [
        "advanced",
        process.env.NODE_ENV === "production"
          ? { cssDeclarationSorter: false }
          : {
              cssDeclarationSorter: false,
              convertValues: false,
              reduceIdents: false,
            },
      ],
    },
    "postcss-custom-media": {},
    "postcss-custom-selectors": {},
    "postcss-inline-svg": {},
    "postcss-jit-props": require("open-props"),
    "postcss-plugin": {},
    "postcss-preset-env": {
      /* https://github.com/csstools/postcss-plugins/tree/main/plugin-packs/postcss-preset-env */
    },
    "postcss-pseudo-class-enter": {},
    "postcss-utilities": {},
    // "posthtml-inline-css": {},
    "rucksack-css": {},
    tailwindcss: {},
  },
};

//* Instructions
//& DoIUse Config
// doiuse: { browsers: ["ie >= 8", "> 1%"],}

//& Open-Props Config
// 'postcss-jit-props': require('open-props'),
//*  or
// 'postcss-jit-props': {
//   files: [require.resolve('open-props/style'),require.resolve('open-props/normalize')],
// },

//& CssNano
// colormin: false,

//& Autoprefixer
// autoprefixer: {},
