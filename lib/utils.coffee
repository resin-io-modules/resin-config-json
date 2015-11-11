###
The MIT License

Copyright (c) 2015 Resin.io, Inc. https://resin.io.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
###

resin = require('resin-sdk')

###*
# @summary Get config partition information
# @function
# @protected
#
# @param {String} type - device type slug
# @fulfil {Object} - config partition information
# @returns {Promise}
#
# @example
# utils.getConfigPartitionInformationByType('raspberry-pi').then (configuration) ->
# 	console.log(configuration.partition)
# 	console.log(configuration.path)
###
exports.getConfigPartitionInformationByType = (type) ->
	return resin.models.device.getManifestBySlug(type).then (manifest) ->
		config = manifest.configuration?.config

		if not config?
			throw new Error("Unsupported device type: #{type}")

		return config
