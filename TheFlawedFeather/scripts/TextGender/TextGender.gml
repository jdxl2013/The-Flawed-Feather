/*
This holds all values for varying gender for text and dialog.
Some of these will be based on RNG, others based on player selection.

In general, these will usually be intended for characters that use different gendered pronouns.
	I.e: Using he/she or they/it, etc.

All of these return a string to then be inserted in the script (GameText).
Input values are: masculine, feminine, neuter, inanimate, neo.
These are being handled like this for language support.

In the case that a language lacks different pronouns,
these can still be used for stuff like variance on stuff like man, woman, person, etc.
Involving romance languages, use one of these at the end of a word:
	gender(masc, fem){}
	
	"Soy un" + gender("", "a") + " perrit" + gender("o", "a") + "."
	"Soy " + gender("un perrito", "una perrita") + "."
	"Soy un perrito."
	"Soy una perrita."
*/

/// More genders can be added to this.
/// This randomizes based on the amound of arguments added.
/// Atleast two are required.
/// @param {String} _masc Masculine
/// @param {String} _fem Feminine
function txt_gndr_default(_masc, _fem) {
	var _rng = irandom(argument_count - 1);
	
	return array_get(argument, _rng);
}