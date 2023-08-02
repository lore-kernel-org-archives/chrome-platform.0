Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2264E6AA1
	for <chrome-platform@lists.linux.dev>; Wed,  2 Aug 2023 10:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50886C433C7;
	Wed,  2 Aug 2023 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690970793;
	bh=/XB26Dqnxa1F9y3iPMQ4wqQzRs/U65R9/Vw0DtKyGCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCA60aFhzBct/AQErAJdV/Ll3bScztDQ4Qb/6SfBtLe9shi/9C7kSlITWzHlDpViH
	 mV38e6J2ubqjQ9PKaKD38D+iIo+p6JGYsAbw0ssIAOETBgslhl5ao/rj79FDpe92/f
	 LYueQ6Gu5ZG6Kvy0HfkAMwTpCSiTbRWulLTHonrHR9oKMe0PJrREB09/ChqRQeyr9r
	 EAamjZxMLP1S+3Yp8Tmb1KPqPDlfNI3XXQ5L30y9oRIhJZ6Y4qRXfqNoeR9Vy5+XAq
	 FoWBSHKI52gP3cJtFC6j97Pf2PRThcIcnspfHIvDmAtfwJectE8EF9SFZBESF0fwZv
	 B8He1Gf/J2+og==
Date: Wed, 2 Aug 2023 18:06:30 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com
Subject: Re: [PATCH] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMoqpq375u2R2H8m@google.com>
References: <20230726073127.2969387-1-tzungbi@kernel.org>
 <ZMh82LaanrHh+33t@google.com>
 <ZMl+2+mr7AiIx7e1@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMl+2+mr7AiIx7e1@google.com>

On Tue, Aug 01, 2023 at 02:53:31PM -0700, Brian Norris wrote:
> Are there any ABI concerns here? As in, did this perhaps work for some
> use cases that will be broken now by this change in format? If not, it
> would be nice to note your thought process on that. [1]

There is an existing use case from userland program[2].  It works with
downstream chromeos_acpi driver but not the upstream one.

[2]: https://crrev.com/48a12071a43813e5bf0694f99e4024468ea900b6/host/arch/x86/lib/crossystem_arch.c#232

> Also, is it possible to use some standard formatting, like
> hex_dump_to_buffer()?

Ack, fix in v2[3].

[3]: https://patchwork.kernel.org/project/chrome-platform/patch/20230802095736.3079963-1-tzungbi@kernel.org/

> Or, would it make more sense to make these into binary attributes
> (struct bin_attribute)?
> 
> NB: the docs (Documentation/ABI/testing/sysfs-driver-chromeos-acpi)
> suggest that some attributes (like VDAT) are indeed binary, and so we
> should probably maintain or fix that.

No.  Unless we also want to change userland program in [2].

> [1] My guess: no real user space actually uses this driver yet, since
> ChromiumOS still has its own downstream variant on its active kernels?

Correct, AFAIK, there has no use cases for the upstream chromeos_acpi driver
yet.
