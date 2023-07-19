using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Sabio.Data;
using Sabio.Models.Domain.Venues;
using Sabio.Services;
using Sabio.Services.Interfaces;
using Sabio.Services.Interfaces.Survey;
using Sabio.Services.Surveys;
using Sabio.Web.Api.StartUp.DependencyInjection;
using Sabio.Web.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Sabio.Web.StartUp
{
    public class DependencyInjection
    {
        public static void ConfigureServices(IServiceCollection services, IConfiguration configuration)
        {
            if (configuration is IConfigurationRoot)
            {
                services.AddSingleton<IConfigurationRoot>(configuration as IConfigurationRoot);   // IConfigurationRoot
            }

            services.AddSingleton<IConfiguration>(configuration);   // IConfiguration explicitly

            services.AddSingleton<IFileService, FileService>();

            string connString = configuration.GetConnectionString("Default");
            // https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-2.2
            // The are a number of differe Add* methods you can use. Please verify which one you
            // should be using services.AddScoped<IMyDependency, MyDependency>();

            // services.AddTransient<IOperationTransient, Operation>();

            // services.AddScoped<IOperationScoped, Operation>();

            // services.AddSingleton<IOperationSingleton, Operation>();

            services.AddSingleton<IAuthenticationService<int>, WebAuthenticationService>();

            services.AddSingleton<Sabio.Data.Providers.IDataProvider, SqlDataProvider>(delegate (IServiceProvider provider)
            {
                return new SqlDataProvider(connString);
            }
            );

            services.AddSingleton<IAppointmentService, AppointmentService>();

            services.AddSingleton<IBaseUserMapper, UserService>();

            services.AddSingleton<IBlogService, BlogService>();

            services.AddSingleton<ICandidatePreferenceServices, CandidatePreferenceServices>();

            services.AddSingleton<ICharitableServices, CharitableServices>();

            services.AddSingleton<ICommentService, CommentsService>();

            services.AddSingleton<ICompensationService, CompensationService>();

            services.AddSingleton<IDegreeService, DegreeService>();

            services.AddSingleton<IEducationRequirementsService, EducationRequirementsService>();

            services.AddSingleton<IEmailSenderService, EmailSenderService>();

            services.AddSingleton<IExperienceService,  ExperienceService>();

            services.AddSingleton<IFAQsService, FAQsService>();

            services.AddSingleton<IGoalService,  GoalService>();

            services.AddSingleton<IGoogleAnalyticsReportService, GoogleAnalyticsReportService>();

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.AddSingleton<IIdentityProvider<int>, WebAuthenticationService>();

            services.AddSingleton<IInviteService, InviteService>();

            services.AddSingleton<IJobService, JobService>();

            services.AddSingleton<IJobSkillsService, JobSkillService>();

            services.AddSingleton<ILicenseServices, LicenseServices>();

            services.AddSingleton<ILocationService, LocationService>();

            services.AddSingleton<ILookUpService, LookUpService>();

            services.AddSingleton<IMessageService, MessageService>(); 

            services.AddSingleton<INewsletterService, NewsletterService>();

            services.AddSingleton<INewsletterContentService, NewsletterContentService>();

            services.AddSingleton<INewsletterSubscriptionService, NewsletterSubscriptionService>();
            services.AddSingleton<INewsletterTemplateMapperService, NewsletterTemplateService>();
            services.AddSingleton<INewsletterTemplateService, NewsletterTemplateService>();

            services.AddSingleton<IOrganizationMemberService , OrganizationMemberService>();
            services.AddSingleton<IOrganizationService, OrganizationService>(); 

            services.AddSingleton<IPersonalValuesService, PersonalValuesService>();

            services.AddSingleton<IPodcastServices, PodcastServices>();

            services.AddSingleton<IRatingService, RatingService>();

            services.AddSingleton<ISchoolMapperService, SchoolService>();
            
            services.AddSingleton<ISchoolService, SchoolService>();

            services.AddSingleton<IShareStoryService, ShareStoryService>();

            services.AddSingleton<ISiteReferencesService, SiteReferencesService>();

            services.AddSingleton<ISkillService, SkillService>();

            services.AddSingleton<IStripeService, StripeService>();

            services.AddSingleton<ISurveyAnswerService, SurveyAnswerService>();

            services.AddSingleton<ISurveyInstanceService, SurveyInstanceService>();

            services.AddSingleton<ISurveyQuestionAnswerOptions, SurveyQuestionAnswerOptionsService>();

            services.AddSingleton<ISurveyQuestionsService, SurveyQuestionsService>();

            services.AddSingleton<ISurveyService, SurveyService>();

            services.AddSingleton<ITeamService, TeamService>();

            services.AddSingleton<IUserEducationService, UserEducationService>(); 

            services.AddSingleton<IUserService, UserService>();
            
            services.AddSingleton<IExternalLinkService, ExternalLinksService>();

            services.AddSingleton<IUserSkillService, UserSkillService>();

            services.AddSingleton<IVenuesService, VenuesService>();

            services.AddSingleton<IVideochatService, VideochatService>();

            services.AddSingleton<IVideochatStatisticsService, VideochatStatisticsService>();

            services.AddSingleton<IWorkHistoryService, WorkHistoryService>();

            services.AddSingleton<IForumsService, ForumsService>();

            GetAllEntities().ForEach(tt =>
            {
                IConfigureDependencyInjection idi = Activator.CreateInstance(tt) as IConfigureDependencyInjection;

                //This will not error by way of being null. BUT if the code within the method does
                // then we would rather have the error loadly on startup then worry about debuging the issues as it runs
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
}
