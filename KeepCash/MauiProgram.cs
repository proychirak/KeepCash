using Microsoft.Extensions.Logging;
using DotNet.Meteor.HotReload.Plugin;
using SkiaSharp.Views.Maui.Controls.Hosting;
using LiveChartsCore.SkiaSharpView.Maui;
using Plugin.LocalNotification;

namespace keepcash;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.UseSkiaSharp()
			.UseLiveCharts()
			.UseLocalNotification()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
				fonts.AddFont("Avenir Heavy.ttf", "AvenirHeavy");
			});

#if DEBUG
		builder.Logging.AddDebug();
		builder.EnableHotReload();
#endif

		return builder.Build();
	}
}
