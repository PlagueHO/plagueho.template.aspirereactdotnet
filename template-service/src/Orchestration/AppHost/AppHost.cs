var builder = DistributedApplication.CreateBuilder(args);

var api = builder.AddProject("api", "../Api/Contoso.Catalog.Api.csproj");

// OPTIONAL_BACKGROUND_WORKER
// var worker = builder.AddProject("worker", "../../Worker/Contoso.Catalog.Worker.csproj");
// worker.WithReference(api);

builder.Build().Run();
