Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3925D35A950
	for <chrome-platform@lists.linux.dev>; Fri, 16 Jan 2026 09:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557086; cv=none; b=SpDf34U6sbsfkqY5pGpHyo7wcsWztfl1zQFbD4ZjCegdC8VTmWBbxml+hpOlIQkXMDyuHIZtTe/0DUgZL/dU3xve0fCV9IaAgUoIu8suMGGDxK72QiBFL5RGHXLyfL7HbUarId0wyVqhCTGV2YC22wA9WwgYpaeFR6qj1ot74qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557086; c=relaxed/simple;
	bh=G0lAoXNnE8zHbc7Q4sP6bIThkQm+fl35P4QPoHmhG5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvSt2+H1kKlqkI6q5Y61Dx0+llzDTyVjyMg6+xPG3TrSGwjjaAc3gCc9/BtETlyv98tWdnASNyNirPp5r8bxu6ztNtPhmHXK6u+HTwERsWeyyMp3leZzEbu2z6mAfXz23KoQZ35jnFd3tIDd7sBWX2wFvVkLz3pPD98Lh9xU7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMRYqRa1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMRYqRa1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DEEC116C6;
	Fri, 16 Jan 2026 09:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768557085;
	bh=G0lAoXNnE8zHbc7Q4sP6bIThkQm+fl35P4QPoHmhG5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMRYqRa1lzkXrJsLQTDXxWE7gIOkK/AZR3GEY3WR4k5DbqQo9Yxav5qlMduZpOWck
	 ap5IP7rG5NJD5ET7kr9xQUuQokctiIC/II4Ds+Fo+f9MQlLpk0ckKGRZd5x2iStQEF
	 VSgqz4wyvSVCf6J8Z1k+TMW35ob5fxlnokkFnufEprvIaIiHvUm34oUNp/lDfiY05G
	 LqFdiSxFVxjVWUlYHvf6QH2cRmcVH6PJU3CJTFTv8wKOSIxVnh1ZP3NzjRfc7nzQgf
	 S3e0/MdWBvhPWWrAlqVKTZDixAm05nK0/+DPzBSDHSChqjTxgw2tKhjsNhNQiG1SqI
	 sFZFdgxV7YzBw==
Date: Fri, 16 Jan 2026 09:51:21 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
Message-ID: <aWoKGXtYPMm71K9a@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <aWoBQGckP3q8KcDX@google.com>
 <07efafb2-30bf-4d45-a53f-114272c1a1b1@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07efafb2-30bf-4d45-a53f-114272c1a1b1@suse.de>

On Fri, Jan 16, 2026 at 10:19:03AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.01.26 um 10:13 schrieb Tzung-Bi Shih:
> > On Thu, Jan 15, 2026 at 08:57:10AM +0100, Thomas Zimmermann wrote:
> > > Coreboot implements framebuffer support via simple-framebuffer. Provide a
> > > dedicated DRM driver. Keep the simple-framebuffer code for now.
> > > 
> > > For each firmware's provided framebuffer, we prefer a dedicated DRM driver
> > > tailored towards the platform's feature set. The coreboot framebuffer
> > > device currently creates a simple-framebuffer device for the provided
> > > framebuffer aperture. But simple-framebuffer is for DeviceTree nodes; not
> > > for coreboot. The simple-framebuffer infrastructure should be phased out
> > > for non-DT use cases. Coreboot is one of the final users of the code
> > > (besides n64).
> > > 
> > > Patches 1 to 5 start by fixing problems in the coreboot framebuffer
> > > implementation. There is a possible dangling pointer, the memory is
> > > marked as busy, the device hierarchy is incorrect, and a few minor things.
> > > 
> > > Patches 6 to 9 prepare the coreboot support for use by external drivers.
> > > Specifically, structures for the entries os the coreboot payload table
> > > have to be exported.
> > > 
> > > Patches 10 to 12 add corebootdrm, a DRM driver for the new
> > > coreboot-framebuffer platform device. Corebootdrm follows the pattern
> > > established by similar drivers. It also uses the same sysfb helpers. It
> > > is therefore fairly small. With patch 11, it has feature parity with
> > > simpledrm on the old simple-framebuffer. Patch 12 adds support for panel-
> > > orientation flags that coreboot makes available.
> > What would you suggest to submit the patches (e.g., which patches submit
> > through which tree)?  Do they have build-time dependencies?
> 
> The patches have no dependencies besides the coreboot and DRM frameworks
> they operate in. DRM moves a lot faster than coreboot, and you likely don't
> have the latest DRM in the coreboot tree. So I'd take them via DRM, if
> possible.

Let's take this way.  I'll try to review the patches and provide my A-b tag
too if possible.

> Note that there will be at least one more update to this series to address
> review comments.

Sure, no rush.
