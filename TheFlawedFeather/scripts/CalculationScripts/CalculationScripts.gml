

/// @param {Real} X		Value to clamp.
/// @param {Real} A		First starting point.
/// @param {Real} B1	Length from A.
/// @param {Real} B2	Length within B1.
/// @param {Real} [C]	Buffer for length B2.
/// @param {Real} [D]	Offset.
/// @description Often used for clamping boxes within boxes: clamp( X , A + C + D, A + B1 - B2 - C + D )
function calc_clamp_lengths(X, A, B1, B2, C = 0, D = 0) {
	var _min = A + C + D;
	var _max = A + B1 - B2 - C + D;
	return clamp(X, _min, _max);
}

/// @param {Real} A Value to use.
/// @param {Real} B Value to compare.
/// @param {Real} C Iteration between the comparison amount.
/// @description Often used to smooth towards another value: A += ( B - A ) / C
function calc_compare_divide(A, B, C) {
	return (B - A) / C;
}

/// @description Replaces and inserts a string at a certain index.
/// @param {String} str
/// @param {Real} index
/// @param {String} insert_str
function string_replace_at(str, index, insert_str) {
	return string_copy(str, 1, index - 1) + insert_str + string_delete(str, 1, index);
}