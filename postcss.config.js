module.exports = {
	plugins: [
		require("postcss-import"),
		require("postcss-flexbugs-fixes"),
		require("postcss-preset-env")({
			antoprefixer: {
				flexbox: "no-2009"
			},
			stage: 3
		})
	]
}