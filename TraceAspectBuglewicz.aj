public aspect TraceAspectBuglewicz {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSignature() + ", " + thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("Before the method: " + info);
	}
	
	after(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("After the method: " + info);
	}
}