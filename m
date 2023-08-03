Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1897F
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 01:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592DDC433C8;
	Thu,  3 Aug 2023 01:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691025499;
	bh=+qodp8RWKnbpxQLGXKlld+a51XvxJnHzOxUjHe5Y0Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tam17VvMJyMEwOlIvodDWNpHfgATVkiBUM43DeTMNIw7iIjNxZXBeyI/ZVCRYqdwX
	 9JRyccpi8C2YfTFx1qtY0zeu06BcCXmaP87DYbVffTOoKDvf7xM4hYL6zlShDGenAy
	 MgEz0kbqNEsVjKCNG0rXW4BO6eS6PC+Q8ZVM4mY84oLF+awq5RoHpyyFav1GgcbKdT
	 PN2gSg2MYIEhEGnh19dpmaO1O+RWJy1skvTWbD28nIxJ+DAY+aesFLGb62A1wUPGn4
	 kBQuUNFeQ8ZNjglxeBSOiyivaItUgPslrew2QAC/B03OcGENr838DJgFrU88URp2u/
	 3DUIzq13VJP1w==
Date: Thu, 3 Aug 2023 09:18:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMsAWIum5+PKBmHh@google.com>
References: <20230726073127.2969387-1-tzungbi@kernel.org>
 <ZMh82LaanrHh+33t@google.com>
 <ZMl+2+mr7AiIx7e1@google.com>
 <ZMoqpq375u2R2H8m@google.com>
 <ZMqnr10+XxNjF7n/@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMqnr10+XxNjF7n/@google.com>

On Wed, Aug 02, 2023 at 11:59:59AM -0700, Brian Norris wrote:
> On Wed, Aug 02, 2023 at 06:06:30PM +0800, Tzung-Bi Shih wrote:
> > On Tue, Aug 01, 2023 at 02:53:31PM -0700, Brian Norris wrote:
> > > NB: the docs (Documentation/ABI/testing/sysfs-driver-chromeos-acpi)
> > > suggest that some attributes (like VDAT) are indeed binary, and so we
> > > should probably maintain or fix that.
> > 
> > No.  Unless we also want to change userland program in [2].
> 
> I mean, I think you need to do one of those two -- either keep this
> (maintain) as "binary", or update (fix) the doc to describe the hex dump
> instead.
> 
> i.e., I think this piece of
> Documentation/ABI/testing/sysfs-driver-chromeos-acpi is now wrong:
> 
> What:           /sys/bus/platform/devices/GGL0001:*/VDAT
> Date:           May 2022
> KernelVersion:  5.19
> Description:
>                 Returns the verified boot data block shared between the
>                 firmware verification step and the kernel verification step
>                 (binary).
> 
> But, the userland program already doesn't know how to handle the
> upstream driver. So it'd be possible to change both at the same time.
> 
> Anyway, hex-encoded is fine with me too; we just need to get the docs to
> match.

Ack, fix in v3 (https://patchwork.kernel.org/project/chrome-platform/patch/20230803011245.3773756-1-tzungbi@kernel.org/).
