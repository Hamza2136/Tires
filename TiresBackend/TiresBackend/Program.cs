using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using TiresBackend.Services.BusinessLogic;
using TiresBackend_DBContext.Data;
using TiresBackend_DBContext.Services.Contract;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<ApplicationDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("Default"), sqlServerOptions => sqlServerOptions.EnableRetryOnFailure());
});
builder.Services.AddScoped<IAccounts, AccountsService>();
builder.Services.AddScoped<IProducts, ProductsService>();
builder.Services.AddScoped<ICart, CartService>();
builder.Services.AddControllers().AddJsonOptions(options =>
{
    options.JsonSerializerOptions.PropertyNamingPolicy = null;
});
//iis service 
builder.Services.Configure<IISServerOptions>(options =>
{
    options.AutomaticAuthentication = false;
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
