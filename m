Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367017C2
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 02:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78411C433D7;
	Fri, 18 Nov 2022 02:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668736868;
	bh=NI+ThJ1IGK19Iit3qvb9g0K7eh5Yy44Q4BXLgtbQeKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbrDxSzQhO7W1h02c2ggEyLF+JxyQbFDT0W2ocUShnVz78k5LqU8MaD9ELJsvCHh0
	 lX8Pldh0AuhNDjKkDLwcD1D8GRmDhVGFwuXpc10BRwpEQXNc6nWMM7UmphgzcqYouu
	 jKQt2GMPjFEeZ87lOYNIGV5Ldfx0uEUYfBCJ3VoNRZyzQevvbSKGRMBbgYTxyVDtBu
	 hHsE86pRMGX8XBrcAiS8CK7qKUYRdv16NwIfAEmpnjEJZG/jKvoKCnkIQFAPswGwj9
	 4FSlbUn/vJo2hg/yBtsiMBz0G1NTL+GSPi5VF3UmgDgqvU8N3bCJre6WBqfNz7qp97
	 8uZGtdvFxHL8A==
Date: Fri, 18 Nov 2022 10:01:05 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: dtor@chromium.org, jwerner@chromium.org, bleung@chromium.org,
	enric.balletbo@collabora.com, groeck@chromium.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 1/1] platform/chrome: Poke kb_wake_angle attribute
 visibility when needed
Message-ID: <Y3bnYT6TXGXhkh/T@google.com>
References: <20210804213139.4139492-1-gwendal@chromium.org>
 <20210804213139.4139492-2-gwendal@chromium.org>
 <CAPUE2usQX_uQewpCYOs3SRUo7vDDMfg=n7idNvCgThDHMqTf7w@mail.gmail.com>
 <CAPUE2uuj1qde16QWHb=0+yMW3ERhXzV7ehGcViWCfij7ADeyWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPUE2uuj1qde16QWHb=0+yMW3ERhXzV7ehGcViWCfij7ADeyWg@mail.gmail.com>

On Wed, Nov 16, 2022 at 10:23:38AM -0800, Gwendal Grignou wrote:
> [+chrome-platform@lists.linux.dev]

Please also Cc to the mailing list if the patch gets chance to have
next version.

> On Mon, Nov 14, 2022 at 8:10 PM Gwendal Grignou <gwendal@chromium.org> wrote:
[...]
> > > Expose the attribute group to alter to close a potiential race between
> > > cros-ec-sensorhub and cros-ec-sysfs (that creates the attribute group
> > > on behalf of the class driver).

I failed to realize the potential race.  Could you explain it a bit?

> > > diff --git a/include/linux/platform_data/cros_ec_proto.h b/include/linux/platform_data/cros_ec_proto.h
> > > index 02599687770c5..c6dca260bbd5d 100644
> > > --- a/include/linux/platform_data/cros_ec_proto.h
> > > +++ b/include/linux/platform_data/cros_ec_proto.h
> > > @@ -191,6 +191,7 @@ struct cros_ec_platform {
> > >  /**
> > >   * struct cros_ec_dev - ChromeOS EC device entry point.
> > >   * @class_dev: Device structure used in sysfs.
> > > + * @groups: sysfs attributes groups for this EC.

The field name has extra "s".
