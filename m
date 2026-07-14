Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98482336EF8
	for <chrome-platform@lists.linux.dev>; Tue, 14 Jul 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030101; cv=none; b=YAMDkhCticCTaqFSKgXCxGLgbrGakB4Q0zA0Y0dWROr3eWcckBu1LbSlstYYoqwkrrYK8DogEIQWls8peSgXn4z7AJLDjdXhlGp6mtak3p2n5k/Tl1XWG/cZxlG1kE7CyrCcaPj2+sXCcSPCjsWRlsImF1grhe4IY8ILkPzmFdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030101; c=relaxed/simple;
	bh=sn3DQJpy6ReW7uOSYShMEblvMP8dRzlC9zpd9dx24jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdJal2Us0iFvjbKc8e2M09SjdjtFeMJrSXS/SkeYymZrvna0skCtPxHXa6ctiIia1YTSBjHl91ObtoYvvEB8y9+BG+y/hX8xROiok3hhqxNMDWdN9HoI2O2bFmfoNbqJdgjd1x93iJt04p7WJJLeF2/qtEN0M3n2oNLWMJt1vQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxvNFGvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxvNFGvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8A91F000E9;
	Tue, 14 Jul 2026 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784030100;
	bh=PhLS7V06EpyHIlDcOK0ca4+tD1fPKSDPe2yxgblcqMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QxvNFGvAIKy5mxNHh0NFVydjR0cUuL+sDlasFG3SoXSvHESU9wYx1v+J2C9ElD9tv
	 lFtyOS7QiHOlsCyzp/Gu4ZbzUAOYLuwsXcAXSm2TUg0jC5ExzgzG4O/nFwKtInQn4X
	 7Kd7YEGo72yC5ZdaJ1p3WnDhKh1Xqb2xGvdaoV4i46NzMI5v1PeJcU7m/970GNE7+U
	 6wLcCzssbQYeBaI6q/R+wRjfob+2z7AlUZrZCj8QYKyISAvQ+k0c7ylybCn2LrMm+D
	 /z8xJq9OYu+x6/6ZvqPMtgQXqdrUK5vhwBv0C0p0YOauyo4zVQA1Z16MwllxioKauS
	 1iYrlniG9Cq+g==
Date: Tue, 14 Jul 2026 11:54:57 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: Bryam Vargas <hexlabsecurity@proton.me>,
	chrome-platform@lists.linux.dev, tfiga@chromium.org,
	suleiman@chromium.org
Subject: Re: [PATCH] platform/chrome: sensorhub: Fix dropped timestamp events
 and log spam
Message-ID: <alYjkXZGWNvvwnct@google.com>
References: <20260714065202.3248017-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714065202.3248017-1-tzungbi@kernel.org>

On Tue, Jul 14, 2026 at 06:52:02AM +0000, Tzung-Bi Shih wrote:
> Commit 833740a2333c ("platform/chrome: sensorhub: Bound the EC-reported
> sensor number") evaluated the `sensor_num` against the bounds limit even
> for timestamp events.  A timestamp event typically has a `sensor_num` of
> 0xff [1], causing the driver to flag it as invalid and skip to the next
> event.
> 
> As a result, we'd see a flooding of "Invalid sensor number 255 from EC"
> warning logs and these timestamp events were being dropped.
> 
> Additionally, the firmware only ORs the tablet mode flag [2] onto
> timestamp events.  Because the firmware strictly generates standalone
> timestamps (without other flags like ODR or FLUSH), bypassing the bounds
> check for anything containing the TIMESTAMP flag is safe and avoids
> invalid array access.
> 
> Skip the bounds check for events carrying the
> MOTIONSENSE_SENSOR_FLAG_TIMESTAMP flag.

Please disregard the patch.  We found this just opens another door for
malfunctioned or compromised firmware to access the array `batch_state`
out of bound.  Will fix it in v2.
