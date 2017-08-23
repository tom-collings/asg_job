This is a sample pipeline to add an application security group (ASG) to a given org/space.

Assume that the user provided has permissions to add an ASG.
Assume that the org/space exists.
If the ASG of that name already exists, this pipeline will update the given ASG with the new JSON and apply the changes.

This pipeline does not restage any of the applications in the org/space as part of applying this new ASG.  That will have to be done as a separate step in a pipeline.
