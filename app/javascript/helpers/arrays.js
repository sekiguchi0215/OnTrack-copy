const Arr = {
	chunk(arr, len) {
		const chunk = []
		const n = arr.length;
		let i = 0
		while (i < n) { chunk.push(arr.slice(i, i += len)); }
		return chunks;
	},
}

export default Arr;