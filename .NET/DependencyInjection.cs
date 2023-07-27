    public class DependencyInjection
    {
        public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {
            if (configuration is IConfigurationRoot)
            {
                services.AddSingleton<IConfigurationRoot>(configuration as IConfigurationRoot);  
            }

            services.AddSingleton<IConfiguration>(configuration); 

            services.AddSingleton<IFileService, FileService>();

            string connString = configuration.GetConnectionString("Default");

            services.AddSingleton<IAuthenticationService<int>, WebAuthenticationService>();

            services.AddSingleton< Data.Providers.IDataProvider, SqlDataProvider>(delegate (IServiceProvider provider)
            {
                return new SqlDataProvider(connString);
            }
            );

            services.AddSingleton<ILicenseServices, LicenseServices>();

            services.AddSingleton<ILookUpService, LookUpService>();

            services.AddSingleton<IPersonalValuesService, PersonalValuesService>();

            services.AddSingleton<IForumsService, ForumsService>();

            GetAllEntities().ForEach(tt =>
            {
                IConfigureDependencyInjection idi = Activator.CreateInstance(tt) as IConfigureDependencyInjection;
                
                idi.ConfigureServices(services, configuration);
            });
        }

        public static List<Type> GetAllEntities()
        {
            return AppDomain.CurrentDomain.GetAssemblies().SelectMany(x => x.GetTypes())
                 .Where(x => typeof(IConfigureDependencyInjection).IsAssignableFrom(x) && !x.IsInterface && !x.IsAbstract)
                 .ToList();
        }

        public static void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
        }
    }

