#define TRUE 1
#define FALSE 0

#define CHEST_OPEN 0
#define CHEST_CLOSED 1
#define CHEST_LOCKED 2

#define AGENDER PLURAL				// "PLURAL" is they/themself/etc; so add 'AGENDER' to make it clearer

#define INFINITY 1.#INF
#define NaN 1.#IND

// Movement flags for pathing & movement

#define ALLOW_NONE 0				// Only use if you're sure - normally ghostly movement should be allowed
#define ALLOW_ALL 65535
#define ALLOW_BASE 32768			// Always allow ghostly movement

#define ALLOW_WALKABLE 1
#define ALLOW_SMALLFLY 2
#define ALLOW_LARGEFLY 4
#define ALLOW_CASTING 8
#define ALLOW_GHOSTLY 32758

// Sound environment variables, for EAX.  A safe assumption that your sound card doesn't actually support this.

#define EnvironmentGeneric 0
#define EnvironmentPaddedCell 1
#define EnvironmentRoom 2
#define EnvironmentBathroom 3
#define EnvironmentLivingRoom 4
#define EnvironmentStoneRoom 5
#define EnvironmentAuditorium 6
#define EnvironmentConcertHall 7
#define EnvironmentCave 8
#define EnvironmentArena 9
#define EnvironmentHangar 10
#define EnvironmentCarpetedHallway 11
#define EnvironmentHallway 12
#define EnvironmentStoneCorridor 13
#define EnvironmentAlley 15
#define EnvironmentForest 16
#define EnvironmentCity 16
#define EnvironmentMountains 17
#define EnvironmentQuarry 18
#define EnvironmentPlain 19
#define EnvironmentParkingLot 20
#define EnvironmentSewer 21
#define EnvironmentUnderwater 22
#define EnvironmentDrugged 23
#define EnvironmentDizzy 24
#define EnvironmentPsychotic 25

#define SoundTypeOneOff 0			// This sound plays once and does not loop
#define SoundTypeAmbience 1			// This is an ambient sound, which may have multiple emission points
#define SoundTypeBGM 2				// This sound is BGM, and is unaffected by environmental factors.
#define SoundTypeMask 3				// Masks sound data to determine Ambience/BGM/One-Off type
#define SoundModeExclusive 32		// This is an 'exclusive' one-off, and the /sound object should not be pooled globally
#define SoundModeNo3D 64			// Disable 3D effects on the sound.  Not applicable to BGMs

// Audo engine defines

#define MaxVoices 512				// Maximum number of dynamic sound emitters at any one time
#define DynamicChannelOffset 16		// What channel number to start assigning from for dynamic emitters
#define SoundChannelBGM 1			// What channel number to use for BGM

#define SFXVolume 15				// TODO move this from a define into the client object
#define MaxVolume 15				// Maximum volume of a sound effect

// ASCII Codes, heavily used in the script parser

#define Tab 9						// ASCII code for a tab 					(	)
#define LineFeed 10					// ASCII code for a line feed 				(\n)
#define CarriageReturn 13			// ASCII code for a carriage return 		(\r)
#define Space 32					// ASCII code for a space 					( )
#define DoubleQuote 34				// ASCII code for a double quote 			(")
#define SingleQuote 39				// ASCII code for a single quote			(')
#define OpenParenthesis 40			// ASCII code for an open parenthesis 		(()
#define EndParenthesis 41			// ASCII code for an end parenthesis 		())
#define Comma 44					// ASCII code for a comma					(,)
#define ForwardSlash 47				// ASCII code for a forward slash 			(/)
#define Semicolon 59				// ASCII code for a semicolon				(;)
#define Equals 61					// ASCII code for an equals sign character	(=)
#define N 78						// ASCII code for N 						(N)
#define R 82						// ASCII code for R 						(R)
#define SmallN 110					// ASCII code for n 						(n)
#define SmallR 114					// ASCII code for r 						(r)
#define Backslash 92				// ASCII code for a backslash 				(\)
#define OpenBracket 123				// ASCII code for a square opening bracket	([)
#define EndBracket 125				// ASCII code for a square end bracket 		(])