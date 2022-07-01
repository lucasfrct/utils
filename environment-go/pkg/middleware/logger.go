package middleware

func Logger() LogProvider {
	logger := LogProvider{}
	logger.New()

	return logger
}
