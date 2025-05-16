; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [337 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [668 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 10266594, ; 2: LiveChartsCore.SkiaSharpView.dll => 0x9ca7e2 => 178
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 250
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 286
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 45981941, ; 9: Xamarin.KotlinX.AtomicFU.Jvm => 0x2bda0f5 => 295
	i32 53857724, ; 10: ca/Microsoft.Maui.Controls.resources => 0x335cdbc => 300
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 194
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 270
	i32 113429830, ; 16: zh-HK/Microsoft.Maui.Controls.resources => 0x6c2cd46 => 330
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 270
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 21: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 222
	i32 166070894, ; 24: Xamarin.KotlinX.AtomicFU.dll => 0x9e60a6e => 294
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 26: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 272
	i32 184328833, ; 27: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 28: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 329
	i32 199333315, ; 29: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 330
	i32 205061960, ; 30: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 31: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 220
	i32 220171995, ; 32: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 33: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 243
	i32 230752869, ; 34: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 35: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 36: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 37: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 225
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 246
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 242
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 301
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 318968648, ; 45: Xamarin.AndroidX.Activity.dll => 0x13031348 => 211
	i32 321597661, ; 46: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 47: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 314
	i32 342366114, ; 48: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 244
	i32 347068432, ; 49: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 204
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 313
	i32 357576608, ; 51: cs/Microsoft.Maui.Controls.resources => 0x15502fa0 => 301
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 333
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 165
	i32 425531652, ; 61: Xamarin.AndroidX.Lifecycle.Runtime.Android => 0x195d1904 => 251
	i32 435591531, ; 62: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 325
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 226
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 240
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 242
	i32 486930444, ; 72: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 258
	i32 498788369, ; 73: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 74: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 312
	i32 503918385, ; 75: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 306
	i32 504143952, ; 76: Plugin.LocalNotification.dll => 0x1e0ca050 => 195
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 188
	i32 525008092, ; 78: SkiaSharp.dll => 0x1f4afcdc => 196
	i32 526420162, ; 79: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527168573, ; 80: hi/Microsoft.Maui.Controls.resources => 0x1f6bf43d => 309
	i32 530272170, ; 81: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 82: Microsoft.Extensions.Logging => 0x20216150 => 184
	i32 540030774, ; 83: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 84: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 85: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 86: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 555133743, ; 87: Xamarin.JSpecify.dll => 0x2116ab2f => 292
	i32 557405415, ; 88: Jsr305Binding => 0x213954e7 => 283
	i32 562814727, ; 89: Xamarin.AndroidX.Core.ViewTree.dll => 0x218bdf07 => 230
	i32 569601784, ; 90: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 281
	i32 577335427, ; 91: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 92: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 320
	i32 601371474, ; 93: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 94: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 95: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 621990341, ; 96: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 0x2512d1c5 => 251
	i32 627609679, ; 97: Xamarin.AndroidX.CustomView => 0x2568904f => 232
	i32 639843206, ; 98: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 238
	i32 643868501, ; 99: System.Net => 0x2660a755 => 81
	i32 662205335, ; 100: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 101: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 277
	i32 666292255, ; 102: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 218
	i32 672442732, ; 103: System.Collections.Concurrent => 0x2814a96c => 8
	i32 679221896, ; 104: Xamarin.KotlinX.AtomicFU => 0x287c1a88 => 294
	i32 683518922, ; 105: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 106: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 300
	i32 690569205, ; 107: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 108: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 296
	i32 693804605, ; 109: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 110: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 111: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 291
	i32 700358131, ; 112: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 703203299, ; 113: keepcash => 0x29ea07e3 => 0
	i32 706645707, ; 114: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 315
	i32 709557578, ; 115: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 303
	i32 722857257, ; 116: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 117: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 736260964, ; 118: LiveChartsCore.Behaviours => 0x2be27364 => 177
	i32 748832960, ; 119: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 202
	i32 752232764, ; 120: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 752882528, ; 121: SQLitePCLRaw.provider.dynamic_cdecl.dll => 0x2ce01360 => 205
	i32 755313932, ; 122: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 208
	i32 759454413, ; 123: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 124: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 125: System.IO.Compression => 0x2e394f87 => 46
	i32 778756650, ; 126: SkiaSharp.HarfBuzz.dll => 0x2e6ae22a => 197
	i32 789151979, ; 127: Microsoft.Extensions.Options => 0x2f0980eb => 187
	i32 790371945, ; 128: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 233
	i32 804715423, ; 129: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 130: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 248
	i32 823281589, ; 131: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 132: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 133: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 134: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 135: Xamarin.AndroidX.Print => 0x3246f6cd => 263
	i32 870878177, ; 136: ar/Microsoft.Maui.Controls.resources => 0x33e88be1 => 299
	i32 873119928, ; 137: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 138: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 139: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 140: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 141: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 142: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 327
	i32 928116545, ; 143: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 286
	i32 952186615, ; 144: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 966729478, ; 145: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 284
	i32 967690846, ; 146: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 244
	i32 975236339, ; 147: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 148: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 149: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 150: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 151: System.Collections.dll => 0x3b2c715c => 12
	i32 993161700, ; 152: zh-Hans/Microsoft.Maui.Controls.resources => 0x3b3271e4 => 331
	i32 994442037, ; 153: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 994547685, ; 154: es/Microsoft.Maui.Controls.resources => 0x3b4797e5 => 305
	i32 1001831731, ; 155: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 156: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 267
	i32 1019214401, ; 157: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 158: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 183
	i32 1029334545, ; 159: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 302
	i32 1031528504, ; 160: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 285
	i32 1034083993, ; 161: LiveChartsCore.SkiaSharpView.Maui.dll => 0x3da2de99 => 179
	i32 1035644815, ; 162: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 216
	i32 1036536393, ; 163: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 164: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 165: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 253
	i32 1067306892, ; 166: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 167: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 168: Xamarin.Kotlin.StdLib => 0x409e66d8 => 293
	i32 1098259244, ; 169: System => 0x41761b2c => 164
	i32 1121599056, ; 170: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 252
	i32 1127624469, ; 171: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 186
	i32 1149092582, ; 172: Xamarin.AndroidX.Window => 0x447dc2e6 => 280
	i32 1170634674, ; 173: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 174: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 276
	i32 1178241025, ; 175: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 261
	i32 1178797549, ; 176: fi/Microsoft.Maui.Controls.resources => 0x464305ed => 306
	i32 1203215381, ; 177: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 319
	i32 1204270330, ; 178: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 218
	i32 1208641965, ; 179: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 180: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 181: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 317
	i32 1243150071, ; 182: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 281
	i32 1246548578, ; 183: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 223
	i32 1253011324, ; 184: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1264511973, ; 185: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 271
	i32 1264890200, ; 186: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 297
	i32 1267360935, ; 187: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 275
	i32 1275534314, ; 188: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 296
	i32 1278448581, ; 189: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 215
	i32 1283425954, ; 190: LiveChartsCore.SkiaSharpView => 0x4c7f86a2 => 178
	i32 1292207520, ; 191: SQLitePCLRaw.core.dll => 0x4d0585a0 => 203
	i32 1293217323, ; 192: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 235
	i32 1303644417, ; 193: DotNet.Meteor.HotReload.Plugin.dll => 0x4db40901 => 173
	i32 1309188875, ; 194: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 195: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 280
	i32 1324164729, ; 196: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 197: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 198: System.IO => 0x514d38cd => 57
	i32 1376866003, ; 199: Xamarin.AndroidX.SavedState => 0x52114ed3 => 267
	i32 1379779777, ; 200: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1382580405, ; 201: keepcash.dll => 0x526880b5 => 0
	i32 1388908186, ; 202: DotNet.Meteor.HotReload.Plugin => 0x52c90e9a => 173
	i32 1402170036, ; 203: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 204: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 227
	i32 1408764838, ; 205: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 206: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 207: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1434145427, ; 208: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 209: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 284
	i32 1437299793, ; 210: Xamarin.AndroidX.Lifecycle.Common.Jvm => 0x55ab7451 => 245
	i32 1439761251, ; 211: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1441095154, ; 212: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 0x55e55df2 => 254
	i32 1452070440, ; 213: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 214: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 215: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 216: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461234159, ; 217: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 218: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 219: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 220: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 217
	i32 1470490898, ; 221: Microsoft.Extensions.Primitives => 0x57a5e912 => 188
	i32 1479771757, ; 222: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 223: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 224: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 225: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 268
	i32 1493001747, ; 226: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 309
	i32 1514721132, ; 227: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 304
	i32 1524747670, ; 228: Plugin.LocalNotification => 0x5ae1cd96 => 195
	i32 1536373174, ; 229: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 230: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 231: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 232: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 233: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 324
	i32 1554762148, ; 234: fr/Microsoft.Maui.Controls.resources => 0x5cabc9a4 => 307
	i32 1565862583, ; 235: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 236: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 237: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 238: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1580413037, ; 239: sv/Microsoft.Maui.Controls.resources => 0x5e33306d => 325
	i32 1582372066, ; 240: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 234
	i32 1591080825, ; 241: zh-Hant/Microsoft.Maui.Controls.resources => 0x5ed5f779 => 332
	i32 1592978981, ; 242: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 243: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 285
	i32 1601112923, ; 244: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 245: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 246: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 247: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 257
	i32 1622358360, ; 248: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1623212457, ; 249: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 199
	i32 1624863272, ; 250: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 279
	i32 1635184631, ; 251: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 238
	i32 1636350590, ; 252: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 231
	i32 1639515021, ; 253: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 254: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 255: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 256: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 257: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 273
	i32 1658251792, ; 258: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 282
	i32 1670060433, ; 259: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 225
	i32 1675553242, ; 260: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 261: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 262: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679391197, ; 263: Xamarin.JSpecify => 0x641979dd => 292
	i32 1679769178, ; 264: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 265: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 266: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1701541528, ; 267: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 268: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 204
	i32 1720223769, ; 269: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 248
	i32 1726116996, ; 270: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 271: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 272: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 221
	i32 1736233607, ; 273: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 322
	i32 1744735666, ; 274: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 275: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 276: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 277: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 278: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 279: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 280: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 272
	i32 1770582343, ; 281: Microsoft.Extensions.Logging.dll => 0x6988f147 => 184
	i32 1776026572, ; 282: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 283: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 284: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1788241197, ; 285: Xamarin.AndroidX.Fragment => 0x6a96652d => 240
	i32 1808609942, ; 286: Xamarin.AndroidX.Loader => 0x6bcd3296 => 257
	i32 1809966115, ; 287: nb/Microsoft.Maui.Controls.resources => 0x6be1e423 => 317
	i32 1813058853, ; 288: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 293
	i32 1813201214, ; 289: Xamarin.Google.Android.Material => 0x6c13413e => 282
	i32 1818569960, ; 290: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 262
	i32 1818787751, ; 291: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1821794637, ; 292: hu/Microsoft.Maui.Controls.resources => 0x6c96614d => 311
	i32 1824175904, ; 293: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 294: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 295: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 185
	i32 1842015223, ; 296: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 328
	i32 1847515442, ; 297: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 208
	i32 1858542181, ; 298: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 299: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1879696579, ; 300: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 301: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 219
	i32 1888955245, ; 302: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 303: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 304: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 305: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1908813208, ; 306: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 288
	i32 1910275211, ; 307: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 308: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 309: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1960264639, ; 310: ja/Microsoft.Maui.Controls.resources => 0x74d743bf => 314
	i32 1961813231, ; 311: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 269
	i32 1968388702, ; 312: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 180
	i32 1985761444, ; 313: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 210
	i32 2011961780, ; 314: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2014344398, ; 315: hr/Microsoft.Maui.Controls.resources => 0x781074ce => 310
	i32 2019465201, ; 316: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 253
	i32 2025202353, ; 317: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 299
	i32 2031763787, ; 318: Xamarin.Android.Glide => 0x791a414b => 207
	i32 2043674646, ; 319: it/Microsoft.Maui.Controls.resources => 0x79d00016 => 313
	i32 2045470958, ; 320: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 321: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 247
	i32 2060060697, ; 322: System.Windows.dll => 0x7aca0819 => 154
	i32 2070888862, ; 323: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 324: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090495875, ; 325: SQLitePCLRaw.provider.dynamic_cdecl => 0x7c9a6f83 => 205
	i32 2090596640, ; 326: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 327: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 206
	i32 2127167465, ; 328: System.Console => 0x7ec9ffe9 => 20
	i32 2129483829, ; 329: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 287
	i32 2142473426, ; 330: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 331: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 332: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2150663486, ; 333: ko/Microsoft.Maui.Controls.resources => 0x8030853e => 315
	i32 2159891885, ; 334: Microsoft.Maui => 0x80bd55ad => 192
	i32 2165051842, ; 335: ro/Microsoft.Maui.Controls.resources => 0x810c11c2 => 322
	i32 2181898931, ; 336: Microsoft.Extensions.Options.dll => 0x820d22b3 => 187
	i32 2192057212, ; 337: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 185
	i32 2193016926, ; 338: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 339: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 298
	i32 2201231467, ; 340: System.Net.Http => 0x8334206b => 64
	i32 2217644978, ; 341: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 276
	i32 2222056684, ; 342: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 343: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 258
	i32 2252106437, ; 344: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 345: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 346: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 347: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 181
	i32 2267999099, ; 348: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 209
	i32 2270573516, ; 349: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 307
	i32 2279755925, ; 350: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 265
	i32 2289298199, ; 351: th/Microsoft.Maui.Controls.resources => 0x8873eb17 => 326
	i32 2293034957, ; 352: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 353: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 354: System.Net.Mail => 0x88ffe49e => 66
	i32 2305521784, ; 355: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 356: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 213
	i32 2320631194, ; 357: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 358: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 359: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 360: System.Net.Primitives => 0x8c40e0db => 70
	i32 2364201794, ; 361: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 200
	i32 2368005991, ; 362: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369760409, ; 363: tr/Microsoft.Maui.Controls.resources => 0x8d3fac99 => 327
	i32 2371007202, ; 364: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 180
	i32 2378619854, ; 365: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 366: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2401565422, ; 367: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 368: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 237
	i32 2421380589, ; 369: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2421992093, ; 370: nl/Microsoft.Maui.Controls.resources => 0x905caa9d => 318
	i32 2435356389, ; 371: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 372: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 373: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 374: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 375: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465273461, ; 376: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 202
	i32 2465532216, ; 377: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 226
	i32 2471841756, ; 378: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 379: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 380: Microsoft.Maui.Controls => 0x93dba8a1 => 190
	i32 2483903535, ; 381: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 382: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 383: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 384: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 250
	i32 2520433370, ; 386: sk/Microsoft.Maui.Controls.resources => 0x963ac2da => 324
	i32 2522472828, ; 387: Xamarin.Android.Glide.dll => 0x9659e17c => 207
	i32 2538310050, ; 388: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2556439392, ; 389: LiveChartsCore.SkiaSharpView.Maui => 0x98602b60 => 179
	i32 2562349572, ; 390: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 391: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 392: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 252
	i32 2581819634, ; 393: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 275
	i32 2585220780, ; 394: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 395: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 396: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2605712449, ; 397: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 298
	i32 2615233544, ; 398: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 241
	i32 2616218305, ; 399: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 186
	i32 2617129537, ; 400: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 401: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 402: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 231
	i32 2624644809, ; 403: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 236
	i32 2625339995, ; 404: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 200
	i32 2627185994, ; 405: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 406: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 407: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 246
	i32 2663391936, ; 408: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 209
	i32 2663698177, ; 409: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 410: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 411: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2671474046, ; 412: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 297
	i32 2676780864, ; 413: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 414: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 415: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 416: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 273
	i32 2715334215, ; 417: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 418: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 419: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 420: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 421: Xamarin.AndroidX.Activity => 0xa2e0939b => 211
	i32 2735172069, ; 422: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 423: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 217
	i32 2740948882, ; 424: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 425: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2758225723, ; 426: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 191
	i32 2764765095, ; 427: Microsoft.Maui.dll => 0xa4caf7a7 => 192
	i32 2765824710, ; 428: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2766642685, ; 429: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 0xa4e79dfd => 254
	i32 2770495804, ; 430: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 291
	i32 2778768386, ; 431: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 278
	i32 2779977773, ; 432: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 266
	i32 2780199943, ; 433: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 0xa5b67c07 => 245
	i32 2788224221, ; 434: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 241
	i32 2795602088, ; 435: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 198
	i32 2801831435, ; 436: Microsoft.Maui.Graphics => 0xa7008e0b => 194
	i32 2802068195, ; 437: uk/Microsoft.Maui.Controls.resources => 0xa7042ae3 => 328
	i32 2803228030, ; 438: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 439: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 305
	i32 2810250172, ; 440: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 227
	i32 2819470561, ; 441: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 442: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 443: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 266
	i32 2824502124, ; 444: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 445: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 318
	i32 2838993487, ; 446: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 255
	i32 2847418871, ; 447: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 287
	i32 2849599387, ; 448: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 449: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 278
	i32 2855708567, ; 450: Xamarin.AndroidX.Transition => 0xaa36a797 => 274
	i32 2857259519, ; 451: el/Microsoft.Maui.Controls.resources => 0xaa4e51ff => 304
	i32 2861098320, ; 452: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 453: Microsoft.Maui.Essentials => 0xaa8a4878 => 193
	i32 2870099610, ; 454: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 212
	i32 2875164099, ; 455: Jsr305Binding.dll => 0xab5f85c3 => 283
	i32 2875220617, ; 456: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2883495834, ; 457: ru/Microsoft.Maui.Controls.resources => 0xabdea79a => 323
	i32 2884993177, ; 458: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 239
	i32 2887636118, ; 459: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 460: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 461: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 462: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 463: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 464: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2912489636, ; 465: SkiaSharp.Views.Android => 0xad9910a4 => 198
	i32 2916838712, ; 466: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 279
	i32 2919462931, ; 467: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 468: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 214
	i32 2936416060, ; 469: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 470: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 471: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 472: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 473: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 474: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 475: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 235
	i32 2987532451, ; 476: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 269
	i32 2996846495, ; 477: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 249
	i32 3016983068, ; 478: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 271
	i32 3023353419, ; 479: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 480: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 243
	i32 3038032645, ; 481: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 333
	i32 3056245963, ; 482: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 268
	i32 3057625584, ; 483: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 259
	i32 3058099980, ; 484: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 290
	i32 3059408633, ; 485: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 486: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 487: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 488: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 311
	i32 3081706019, ; 489: LiveChartsCore => 0xb7af1a23 => 176
	i32 3090735792, ; 490: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 491: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 492: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 493: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 494: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 495: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 496: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 497: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 498: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 499: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 500: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 501: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 260
	i32 3192346100, ; 502: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 503: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 504: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 505: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 506: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 234
	i32 3220365878, ; 507: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 508: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3230466174, ; 509: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 288
	i32 3238754727, ; 510: Xamarin.AndroidX.Core.ViewTree => 0xc10b79a7 => 230
	i32 3251039220, ; 511: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 512: Xamarin.AndroidX.CardView => 0xc235e84d => 221
	i32 3265493905, ; 513: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 514: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 515: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 516: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 517: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 518: SQLite-net.dll => 0xc3e9b3a2 => 201
	i32 3290767353, ; 519: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 520: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 521: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3316684772, ; 522: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 523: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 232
	i32 3317144872, ; 524: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 525: SkiaSharp => 0xc71a4669 => 196
	i32 3340431453, ; 526: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 219
	i32 3345895724, ; 527: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 264
	i32 3346324047, ; 528: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 261
	i32 3358260929, ; 529: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 530: SQLitePCLRaw.core => 0xc849ca45 => 203
	i32 3362336904, ; 531: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 212
	i32 3362522851, ; 532: Xamarin.AndroidX.Core => 0xc86c06e3 => 228
	i32 3366347497, ; 533: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 534: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 265
	i32 3384551493, ; 535: LiveChartsCore.dll => 0xc9bc2845 => 176
	i32 3395150330, ; 536: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 537: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 538: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 233
	i32 3428513518, ; 539: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 182
	i32 3429136800, ; 540: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 541: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 542: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 236
	i32 3445260447, ; 543: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 544: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 189
	i32 3463511458, ; 545: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 310
	i32 3471940407, ; 546: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 547: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 199
	i32 3476120550, ; 548: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 549: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 323
	i32 3485117614, ; 550: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 551: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 552: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 224
	i32 3494395880, ; 553: Xamarin.GooglePlayServices.Location.dll => 0xd0483fe8 => 289
	i32 3509114376, ; 554: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 555: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 556: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 557: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3542658132, ; 558: vi/Microsoft.Maui.Controls.resources => 0xd328ac54 => 329
	i32 3556829416, ; 559: LiveChartsCore.Behaviours.dll => 0xd400e8e8 => 177
	i32 3560100363, ; 560: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 561: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3596930546, ; 562: de/Microsoft.Maui.Controls.resources => 0xd664cdf2 => 303
	i32 3597029428, ; 563: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 210
	i32 3598340787, ; 564: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 565: System.Linq.dll => 0xd715a361 => 61
	i32 3623444314, ; 566: da/Microsoft.Maui.Controls.resources => 0xd7f95f5a => 302
	i32 3624195450, ; 567: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 568: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 263
	i32 3633644679, ; 569: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 214
	i32 3638274909, ; 570: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 571: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 247
	i32 3643854240, ; 572: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 260
	i32 3645089577, ; 573: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3647796983, ; 574: pt-BR/Microsoft.Maui.Controls.resources => 0xd96cf6f7 => 320
	i32 3657292374, ; 575: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 181
	i32 3660523487, ; 576: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3662115805, ; 577: he/Microsoft.Maui.Controls.resources => 0xda4773dd => 308
	i32 3672681054, ; 578: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 579: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 220
	i32 3684561358, ; 580: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 224
	i32 3686075795, ; 581: ms/Microsoft.Maui.Controls.resources => 0xdbb50d93 => 316
	i32 3697841164, ; 582: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 332
	i32 3700866549, ; 583: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 584: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 229
	i32 3716563718, ; 585: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 586: Xamarin.AndroidX.Annotation => 0xdda814c6 => 213
	i32 3724971120, ; 587: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 259
	i32 3732100267, ; 588: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 589: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 590: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 591: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3754567612, ; 592: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 206
	i32 3786282454, ; 593: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 222
	i32 3792276235, ; 594: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3792835768, ; 595: HarfBuzzSharp => 0xe21214b8 => 175
	i32 3800979733, ; 596: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 189
	i32 3802395368, ; 597: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 598: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 599: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 600: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 601: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 183
	i32 3844307129, ; 602: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 603: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 604: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 605: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 606: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 607: SQLite-net => 0xe70c9739 => 201
	i32 3885497537, ; 608: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 609: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 274
	i32 3888767677, ; 610: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 264
	i32 3889960447, ; 611: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 331
	i32 3896106733, ; 612: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 613: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 228
	i32 3901907137, ; 614: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3910130544, ; 615: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 223
	i32 3920810846, ; 616: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 617: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 277
	i32 3928044579, ; 618: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 619: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 620: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 262
	i32 3945713374, ; 621: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 622: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 623: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 216
	i32 3959773229, ; 624: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 249
	i32 3967165417, ; 625: Xamarin.GooglePlayServices.Location => 0xec7623e9 => 289
	i32 3970018735, ; 626: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 290
	i32 3980434154, ; 627: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 326
	i32 3987592930, ; 628: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 308
	i32 4003436829, ; 629: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4003906742, ; 630: HarfBuzzSharp.dll => 0xeea6c4b6 => 175
	i32 4015948917, ; 631: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 215
	i32 4025784931, ; 632: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 633: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 191
	i32 4054681211, ; 634: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4066802364, ; 635: SkiaSharp.HarfBuzz => 0xf2667abc => 197
	i32 4068434129, ; 636: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4070331268, ; 637: id/Microsoft.Maui.Controls.resources => 0xf29c5384 => 312
	i32 4073602200, ; 638: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 639: Microsoft.Maui.Essentials.dll => 0xf40add04 => 193
	i32 4099507663, ; 640: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 641: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 642: Xamarin.AndroidX.Emoji2 => 0xf479582c => 237
	i32 4102112229, ; 643: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 321
	i32 4119206479, ; 644: pl/Microsoft.Maui.Controls.resources => 0xf5861a4f => 319
	i32 4125707920, ; 645: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 316
	i32 4126470640, ; 646: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 182
	i32 4127667938, ; 647: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 648: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 649: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4151237749, ; 650: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 651: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 652: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 653: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 654: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 655: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 256
	i32 4185676441, ; 656: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 657: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 658: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4228543782, ; 659: Xamarin.KotlinX.AtomicFU.Jvm.dll => 0xfc0a7526 => 295
	i32 4234116406, ; 660: pt/Microsoft.Maui.Controls.resources => 0xfc5f7d36 => 321
	i32 4256097574, ; 661: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 229
	i32 4258378803, ; 662: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 255
	i32 4260525087, ; 663: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 664: Microsoft.Maui.Controls.dll => 0xfea12dee => 190
	i32 4274976490, ; 665: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 666: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 256
	i32 4294763496 ; 667: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 239
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [668 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 178, ; 2
	i32 108, ; 3
	i32 250, ; 4
	i32 286, ; 5
	i32 48, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 295, ; 9
	i32 300, ; 10
	i32 30, ; 11
	i32 124, ; 12
	i32 194, ; 13
	i32 102, ; 14
	i32 270, ; 15
	i32 330, ; 16
	i32 107, ; 17
	i32 270, ; 18
	i32 139, ; 19
	i32 77, ; 20
	i32 124, ; 21
	i32 13, ; 22
	i32 222, ; 23
	i32 294, ; 24
	i32 132, ; 25
	i32 272, ; 26
	i32 151, ; 27
	i32 329, ; 28
	i32 330, ; 29
	i32 18, ; 30
	i32 220, ; 31
	i32 26, ; 32
	i32 243, ; 33
	i32 1, ; 34
	i32 59, ; 35
	i32 42, ; 36
	i32 91, ; 37
	i32 225, ; 38
	i32 147, ; 39
	i32 246, ; 40
	i32 242, ; 41
	i32 301, ; 42
	i32 54, ; 43
	i32 69, ; 44
	i32 211, ; 45
	i32 83, ; 46
	i32 314, ; 47
	i32 244, ; 48
	i32 204, ; 49
	i32 313, ; 50
	i32 301, ; 51
	i32 131, ; 52
	i32 55, ; 53
	i32 149, ; 54
	i32 74, ; 55
	i32 145, ; 56
	i32 62, ; 57
	i32 146, ; 58
	i32 333, ; 59
	i32 165, ; 60
	i32 251, ; 61
	i32 325, ; 62
	i32 226, ; 63
	i32 12, ; 64
	i32 240, ; 65
	i32 125, ; 66
	i32 152, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 242, ; 71
	i32 258, ; 72
	i32 84, ; 73
	i32 312, ; 74
	i32 306, ; 75
	i32 195, ; 76
	i32 188, ; 77
	i32 196, ; 78
	i32 150, ; 79
	i32 309, ; 80
	i32 60, ; 81
	i32 184, ; 82
	i32 51, ; 83
	i32 103, ; 84
	i32 114, ; 85
	i32 40, ; 86
	i32 292, ; 87
	i32 283, ; 88
	i32 230, ; 89
	i32 281, ; 90
	i32 120, ; 91
	i32 320, ; 92
	i32 52, ; 93
	i32 44, ; 94
	i32 119, ; 95
	i32 251, ; 96
	i32 232, ; 97
	i32 238, ; 98
	i32 81, ; 99
	i32 136, ; 100
	i32 277, ; 101
	i32 218, ; 102
	i32 8, ; 103
	i32 294, ; 104
	i32 73, ; 105
	i32 300, ; 106
	i32 155, ; 107
	i32 296, ; 108
	i32 154, ; 109
	i32 92, ; 110
	i32 291, ; 111
	i32 45, ; 112
	i32 0, ; 113
	i32 315, ; 114
	i32 303, ; 115
	i32 109, ; 116
	i32 129, ; 117
	i32 177, ; 118
	i32 202, ; 119
	i32 25, ; 120
	i32 205, ; 121
	i32 208, ; 122
	i32 72, ; 123
	i32 55, ; 124
	i32 46, ; 125
	i32 197, ; 126
	i32 187, ; 127
	i32 233, ; 128
	i32 22, ; 129
	i32 248, ; 130
	i32 86, ; 131
	i32 43, ; 132
	i32 160, ; 133
	i32 71, ; 134
	i32 263, ; 135
	i32 299, ; 136
	i32 3, ; 137
	i32 42, ; 138
	i32 63, ; 139
	i32 16, ; 140
	i32 53, ; 141
	i32 327, ; 142
	i32 286, ; 143
	i32 105, ; 144
	i32 284, ; 145
	i32 244, ; 146
	i32 34, ; 147
	i32 158, ; 148
	i32 85, ; 149
	i32 32, ; 150
	i32 12, ; 151
	i32 331, ; 152
	i32 51, ; 153
	i32 305, ; 154
	i32 56, ; 155
	i32 267, ; 156
	i32 36, ; 157
	i32 183, ; 158
	i32 302, ; 159
	i32 285, ; 160
	i32 179, ; 161
	i32 216, ; 162
	i32 35, ; 163
	i32 58, ; 164
	i32 253, ; 165
	i32 174, ; 166
	i32 17, ; 167
	i32 293, ; 168
	i32 164, ; 169
	i32 252, ; 170
	i32 186, ; 171
	i32 280, ; 172
	i32 153, ; 173
	i32 276, ; 174
	i32 261, ; 175
	i32 306, ; 176
	i32 319, ; 177
	i32 218, ; 178
	i32 29, ; 179
	i32 52, ; 180
	i32 317, ; 181
	i32 281, ; 182
	i32 223, ; 183
	i32 5, ; 184
	i32 271, ; 185
	i32 297, ; 186
	i32 275, ; 187
	i32 296, ; 188
	i32 215, ; 189
	i32 178, ; 190
	i32 203, ; 191
	i32 235, ; 192
	i32 173, ; 193
	i32 85, ; 194
	i32 280, ; 195
	i32 61, ; 196
	i32 112, ; 197
	i32 57, ; 198
	i32 267, ; 199
	i32 99, ; 200
	i32 0, ; 201
	i32 173, ; 202
	i32 19, ; 203
	i32 227, ; 204
	i32 111, ; 205
	i32 101, ; 206
	i32 102, ; 207
	i32 104, ; 208
	i32 284, ; 209
	i32 245, ; 210
	i32 71, ; 211
	i32 254, ; 212
	i32 38, ; 213
	i32 32, ; 214
	i32 103, ; 215
	i32 73, ; 216
	i32 9, ; 217
	i32 123, ; 218
	i32 46, ; 219
	i32 217, ; 220
	i32 188, ; 221
	i32 9, ; 222
	i32 43, ; 223
	i32 4, ; 224
	i32 268, ; 225
	i32 309, ; 226
	i32 304, ; 227
	i32 195, ; 228
	i32 31, ; 229
	i32 138, ; 230
	i32 92, ; 231
	i32 93, ; 232
	i32 324, ; 233
	i32 307, ; 234
	i32 49, ; 235
	i32 141, ; 236
	i32 112, ; 237
	i32 140, ; 238
	i32 325, ; 239
	i32 234, ; 240
	i32 332, ; 241
	i32 115, ; 242
	i32 285, ; 243
	i32 157, ; 244
	i32 76, ; 245
	i32 79, ; 246
	i32 257, ; 247
	i32 37, ; 248
	i32 199, ; 249
	i32 279, ; 250
	i32 238, ; 251
	i32 231, ; 252
	i32 64, ; 253
	i32 138, ; 254
	i32 15, ; 255
	i32 116, ; 256
	i32 273, ; 257
	i32 282, ; 258
	i32 225, ; 259
	i32 48, ; 260
	i32 70, ; 261
	i32 80, ; 262
	i32 292, ; 263
	i32 126, ; 264
	i32 94, ; 265
	i32 121, ; 266
	i32 26, ; 267
	i32 204, ; 268
	i32 248, ; 269
	i32 97, ; 270
	i32 28, ; 271
	i32 221, ; 272
	i32 322, ; 273
	i32 149, ; 274
	i32 169, ; 275
	i32 4, ; 276
	i32 98, ; 277
	i32 33, ; 278
	i32 93, ; 279
	i32 272, ; 280
	i32 184, ; 281
	i32 21, ; 282
	i32 41, ; 283
	i32 170, ; 284
	i32 240, ; 285
	i32 257, ; 286
	i32 317, ; 287
	i32 293, ; 288
	i32 282, ; 289
	i32 262, ; 290
	i32 2, ; 291
	i32 311, ; 292
	i32 134, ; 293
	i32 111, ; 294
	i32 185, ; 295
	i32 328, ; 296
	i32 208, ; 297
	i32 58, ; 298
	i32 95, ; 299
	i32 39, ; 300
	i32 219, ; 301
	i32 25, ; 302
	i32 94, ; 303
	i32 89, ; 304
	i32 99, ; 305
	i32 288, ; 306
	i32 10, ; 307
	i32 87, ; 308
	i32 100, ; 309
	i32 314, ; 310
	i32 269, ; 311
	i32 180, ; 312
	i32 210, ; 313
	i32 7, ; 314
	i32 310, ; 315
	i32 253, ; 316
	i32 299, ; 317
	i32 207, ; 318
	i32 313, ; 319
	i32 88, ; 320
	i32 247, ; 321
	i32 154, ; 322
	i32 33, ; 323
	i32 116, ; 324
	i32 205, ; 325
	i32 82, ; 326
	i32 206, ; 327
	i32 20, ; 328
	i32 287, ; 329
	i32 11, ; 330
	i32 162, ; 331
	i32 3, ; 332
	i32 315, ; 333
	i32 192, ; 334
	i32 322, ; 335
	i32 187, ; 336
	i32 185, ; 337
	i32 84, ; 338
	i32 298, ; 339
	i32 64, ; 340
	i32 276, ; 341
	i32 143, ; 342
	i32 258, ; 343
	i32 157, ; 344
	i32 41, ; 345
	i32 117, ; 346
	i32 181, ; 347
	i32 209, ; 348
	i32 307, ; 349
	i32 265, ; 350
	i32 326, ; 351
	i32 131, ; 352
	i32 75, ; 353
	i32 66, ; 354
	i32 172, ; 355
	i32 213, ; 356
	i32 143, ; 357
	i32 106, ; 358
	i32 151, ; 359
	i32 70, ; 360
	i32 200, ; 361
	i32 156, ; 362
	i32 327, ; 363
	i32 180, ; 364
	i32 121, ; 365
	i32 127, ; 366
	i32 152, ; 367
	i32 237, ; 368
	i32 141, ; 369
	i32 318, ; 370
	i32 20, ; 371
	i32 14, ; 372
	i32 135, ; 373
	i32 75, ; 374
	i32 59, ; 375
	i32 202, ; 376
	i32 226, ; 377
	i32 167, ; 378
	i32 168, ; 379
	i32 190, ; 380
	i32 15, ; 381
	i32 74, ; 382
	i32 6, ; 383
	i32 23, ; 384
	i32 250, ; 385
	i32 324, ; 386
	i32 207, ; 387
	i32 91, ; 388
	i32 179, ; 389
	i32 1, ; 390
	i32 136, ; 391
	i32 252, ; 392
	i32 275, ; 393
	i32 134, ; 394
	i32 69, ; 395
	i32 146, ; 396
	i32 298, ; 397
	i32 241, ; 398
	i32 186, ; 399
	i32 88, ; 400
	i32 96, ; 401
	i32 231, ; 402
	i32 236, ; 403
	i32 200, ; 404
	i32 31, ; 405
	i32 45, ; 406
	i32 246, ; 407
	i32 209, ; 408
	i32 109, ; 409
	i32 158, ; 410
	i32 35, ; 411
	i32 297, ; 412
	i32 22, ; 413
	i32 114, ; 414
	i32 57, ; 415
	i32 273, ; 416
	i32 144, ; 417
	i32 118, ; 418
	i32 120, ; 419
	i32 110, ; 420
	i32 211, ; 421
	i32 139, ; 422
	i32 217, ; 423
	i32 54, ; 424
	i32 105, ; 425
	i32 191, ; 426
	i32 192, ; 427
	i32 133, ; 428
	i32 254, ; 429
	i32 291, ; 430
	i32 278, ; 431
	i32 266, ; 432
	i32 245, ; 433
	i32 241, ; 434
	i32 198, ; 435
	i32 194, ; 436
	i32 328, ; 437
	i32 159, ; 438
	i32 305, ; 439
	i32 227, ; 440
	i32 163, ; 441
	i32 132, ; 442
	i32 266, ; 443
	i32 161, ; 444
	i32 318, ; 445
	i32 255, ; 446
	i32 287, ; 447
	i32 140, ; 448
	i32 278, ; 449
	i32 274, ; 450
	i32 304, ; 451
	i32 169, ; 452
	i32 193, ; 453
	i32 212, ; 454
	i32 283, ; 455
	i32 40, ; 456
	i32 323, ; 457
	i32 239, ; 458
	i32 81, ; 459
	i32 56, ; 460
	i32 37, ; 461
	i32 97, ; 462
	i32 166, ; 463
	i32 172, ; 464
	i32 198, ; 465
	i32 279, ; 466
	i32 82, ; 467
	i32 214, ; 468
	i32 98, ; 469
	i32 30, ; 470
	i32 159, ; 471
	i32 18, ; 472
	i32 127, ; 473
	i32 119, ; 474
	i32 235, ; 475
	i32 269, ; 476
	i32 249, ; 477
	i32 271, ; 478
	i32 165, ; 479
	i32 243, ; 480
	i32 333, ; 481
	i32 268, ; 482
	i32 259, ; 483
	i32 290, ; 484
	i32 170, ; 485
	i32 16, ; 486
	i32 144, ; 487
	i32 311, ; 488
	i32 176, ; 489
	i32 125, ; 490
	i32 118, ; 491
	i32 38, ; 492
	i32 115, ; 493
	i32 47, ; 494
	i32 142, ; 495
	i32 117, ; 496
	i32 34, ; 497
	i32 174, ; 498
	i32 95, ; 499
	i32 53, ; 500
	i32 260, ; 501
	i32 129, ; 502
	i32 153, ; 503
	i32 24, ; 504
	i32 161, ; 505
	i32 234, ; 506
	i32 148, ; 507
	i32 104, ; 508
	i32 288, ; 509
	i32 230, ; 510
	i32 89, ; 511
	i32 221, ; 512
	i32 60, ; 513
	i32 142, ; 514
	i32 100, ; 515
	i32 5, ; 516
	i32 13, ; 517
	i32 201, ; 518
	i32 122, ; 519
	i32 135, ; 520
	i32 28, ; 521
	i32 72, ; 522
	i32 232, ; 523
	i32 24, ; 524
	i32 196, ; 525
	i32 219, ; 526
	i32 264, ; 527
	i32 261, ; 528
	i32 137, ; 529
	i32 203, ; 530
	i32 212, ; 531
	i32 228, ; 532
	i32 168, ; 533
	i32 265, ; 534
	i32 176, ; 535
	i32 101, ; 536
	i32 123, ; 537
	i32 233, ; 538
	i32 182, ; 539
	i32 163, ; 540
	i32 167, ; 541
	i32 236, ; 542
	i32 39, ; 543
	i32 189, ; 544
	i32 310, ; 545
	i32 17, ; 546
	i32 199, ; 547
	i32 171, ; 548
	i32 323, ; 549
	i32 137, ; 550
	i32 150, ; 551
	i32 224, ; 552
	i32 289, ; 553
	i32 155, ; 554
	i32 130, ; 555
	i32 19, ; 556
	i32 65, ; 557
	i32 329, ; 558
	i32 177, ; 559
	i32 147, ; 560
	i32 47, ; 561
	i32 303, ; 562
	i32 210, ; 563
	i32 79, ; 564
	i32 61, ; 565
	i32 302, ; 566
	i32 106, ; 567
	i32 263, ; 568
	i32 214, ; 569
	i32 49, ; 570
	i32 247, ; 571
	i32 260, ; 572
	i32 14, ; 573
	i32 320, ; 574
	i32 181, ; 575
	i32 68, ; 576
	i32 308, ; 577
	i32 171, ; 578
	i32 220, ; 579
	i32 224, ; 580
	i32 316, ; 581
	i32 332, ; 582
	i32 78, ; 583
	i32 229, ; 584
	i32 108, ; 585
	i32 213, ; 586
	i32 259, ; 587
	i32 67, ; 588
	i32 63, ; 589
	i32 27, ; 590
	i32 160, ; 591
	i32 206, ; 592
	i32 222, ; 593
	i32 10, ; 594
	i32 175, ; 595
	i32 189, ; 596
	i32 11, ; 597
	i32 78, ; 598
	i32 126, ; 599
	i32 83, ; 600
	i32 183, ; 601
	i32 66, ; 602
	i32 107, ; 603
	i32 65, ; 604
	i32 128, ; 605
	i32 122, ; 606
	i32 201, ; 607
	i32 77, ; 608
	i32 274, ; 609
	i32 264, ; 610
	i32 331, ; 611
	i32 8, ; 612
	i32 228, ; 613
	i32 2, ; 614
	i32 223, ; 615
	i32 44, ; 616
	i32 277, ; 617
	i32 156, ; 618
	i32 128, ; 619
	i32 262, ; 620
	i32 23, ; 621
	i32 133, ; 622
	i32 216, ; 623
	i32 249, ; 624
	i32 289, ; 625
	i32 290, ; 626
	i32 326, ; 627
	i32 308, ; 628
	i32 29, ; 629
	i32 175, ; 630
	i32 215, ; 631
	i32 62, ; 632
	i32 191, ; 633
	i32 90, ; 634
	i32 197, ; 635
	i32 87, ; 636
	i32 312, ; 637
	i32 148, ; 638
	i32 193, ; 639
	i32 36, ; 640
	i32 86, ; 641
	i32 237, ; 642
	i32 321, ; 643
	i32 319, ; 644
	i32 316, ; 645
	i32 182, ; 646
	i32 50, ; 647
	i32 6, ; 648
	i32 90, ; 649
	i32 21, ; 650
	i32 162, ; 651
	i32 96, ; 652
	i32 50, ; 653
	i32 113, ; 654
	i32 256, ; 655
	i32 130, ; 656
	i32 76, ; 657
	i32 27, ; 658
	i32 295, ; 659
	i32 321, ; 660
	i32 229, ; 661
	i32 255, ; 662
	i32 7, ; 663
	i32 190, ; 664
	i32 110, ; 665
	i32 256, ; 666
	i32 239 ; 667
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
