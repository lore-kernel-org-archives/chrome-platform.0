Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539F472617
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jun 2025 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733966; cv=none; b=V/GgDwsWgbvaFStybtk5gMmkT0k+Zuo4wtcXwCrRYaTEJRZDRFwy+9EQghsLGmcxY78xYQIHeWFdUfe1jHBWl0Hty/o+BB8TKCJ4fCt7WCVSWjjO8kfV3KwzsNyALFZynCk38cWKhAjfchPw+5P3UicNGmQSGoVRcfLZ4EVzG/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733966; c=relaxed/simple;
	bh=kTWCBb8FEMg2DW8kAgoAg54Bp5ruSPYUh0EXremzJuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7rHFbCLzWSsDVy25qBqUEld4qYMdEDvkILy7V+zz1HceE0fxkjd0bC5jCpp8VUc85qHYoGoE7+25iRCkLjNEOszcWaA6gJ/768pi4MU0KH/dna72I0DKdWyPqI2mZfD9gHj9vbCSvhXgcwmqVxwbXh6u//q+PDuArTGIocTu0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaxyvZUi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaxyvZUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37872C4CEEA;
	Tue, 24 Jun 2025 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750733965;
	bh=kTWCBb8FEMg2DW8kAgoAg54Bp5ruSPYUh0EXremzJuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaxyvZUiiduB1De9UoOkyvygxEKCAxcq8iVkzoG+T+LUDdExha5DEJOb1PZyi3/SO
	 xchd6qVwQ0yE1WpuI1xk8jwSSWKu0Zk9N/2ehKK2hp6SdL9ygWS/FOcw9DkY+kfs3q
	 /Dxx+whWgLn04Os6ZcE77kmyFrKZwIA/opISRg9TEFJ+4wX9y6MPatv8vbgB6RaEg/
	 OMARb4wbTwLyU57i6sLUA9c36XdBzcCc8tinQgPAQmfNxpXgZ4SaMAemA2Bxaqaw1y
	 sxC8qwop2bSa3R2h//2e9EhIan3TRl9bk6nJnljIKOTv6NRh1gO8QorhzqY0J2idtr
	 +Zv9UQWLMjZ8A==
Date: Tue, 24 Jun 2025 02:59:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH] platform: chromeos: sensorhub: retries when a sensor is
 not ready
Message-ID: <aFoUi9zUqG_J5yVq@google.com>
References: <20250623210518.306740-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623210518.306740-1-gwendal@google.com>

On Mon, Jun 23, 2025 at 02:05:18PM -0700, Gwendal Grignou wrote:
> When the EC/ISH starts, it can take a while for all the sensors to be up
> and running or declared broken.
> 
> If the sensor stack return -EBUSY when checking for sensor information,
> retry up to 50 times.
> It has been observed 100ms wait time is enough to have valid sensors
> ready. It can take more time in case a sensor is really broken and is
> not coming up.
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform: chromeos: sensorhub: retries when a sensor is not ready
      commit: 981d7f91aeda17424b29f033249f4fa7cd2a7556

Thanks!
