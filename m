Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2075538F925
	for <chrome-platform@lists.linux.dev>; Thu,  2 Jul 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981151; cv=none; b=NfIb6b2gL7PqbcgBqSySmEq9oQeD76kBNqUDPFZnWLsfSe/zVsyIo8kHwIM1Qo72z2FhJkDIWf0wP2S8wim/sMwiRgQegaiej3byT9o9WGQaoquw4A6NnACyuEzcFvg6BfK+GPB1Ve2XZ0pZ3GHDHhk1RkG3PVTTYJgF6chAYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981151; c=relaxed/simple;
	bh=bnB9wnhX67ni0olGovB466W34gMtR1OtJb1JrjgiPb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfNG8KBq2P2lJW/0Vkl88jgSUtyaP35Sm98yVdUokphfBlICOZVIE111LMb+Z68/YCMoqa6Mb/JGmE9evhTlifLyaH7NLIbI+asdbVau6eBnxpZpURUj/BKo2701kOlZJHb91ejbq0jKZo70wLnK53GCP+BUdjV79b+sH5wQ34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0FK/Zda; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0FK/Zda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5201F00A3A;
	Thu,  2 Jul 2026 08:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782981150;
	bh=+lBxZSCvIQyOykflSZRfbD+XpsYCRG1FVpCKXeHNuIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0FK/ZdaZATi/SkiMuMVLcDRsKC1FT2XnD4zCkkHWYQrTxZA1Qv+Bhz1oPQOd7+28
	 xvVLNXuO3c88LDKZOeF5R6YS5vqXda+rt9uGAaE/3l90Cn9K0IVjSonQl7FsrvleWO
	 sSHgKlCoepcYRpKY0kHOxDQAr9xU1PyqmbWwkdWLpOEMfn5TJJ745taDS7g4MTTWpl
	 ysNAgpietaunLZB4qt8UChYA1US3Tvb3Wr2ku7fioyTomm0rs0ZMvNtLn49jHnbJsv
	 Nblh9BY1rZ70TPushs4QCEqt7rcDuXcrVgKduR5647dh02SFmm4piGS9TxckGNr0GC
	 sIyupy/13BdxQ==
Date: Thu, 2 Jul 2026 08:32:27 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	suleiman@chromium.org
Subject: Re: [PATCH] platform/chrome: sensorhub: Fix memory overread in ring
 handler
Message-ID: <akYiGzgj79EBTmcv@google.com>
References: <20260629092414.3028387-1-tzungbi@kernel.org>
 <CAAFQd5D7MqL-dK8Q12f6fsXz1tWmuXSA81XPMMqjKG==taxzOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5D7MqL-dK8Q12f6fsXz1tWmuXSA81XPMMqjKG==taxzOA@mail.gmail.com>

On Wed, Jul 01, 2026 at 04:20:44PM +0900, Tomasz Figa wrote:
> > diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > index 64e9615ed6f4..4b4adc38485c 100644
> > --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> > @@ -825,11 +825,19 @@ static void cros_ec_sensorhub_ring_handler(struct cros_ec_sensorhub *sensorhub)
> >                 sensorhub->msg->outsize = 1;
> >                 sensorhub->msg->insize = fifo_info_length;
> >
> > -               if (cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg) < 0)
> > +               ret = cros_ec_cmd_xfer_status(ec->ec_dev, sensorhub->msg);
> > +               if (ret < 0)
> 
> I think it would be much safer to just error out if ret != fifo_info_length:
>  - The data read here is used later in the code. Filling the array
> with zeroes would cause the code to act on some data that doesn't
> match the real hardware state, potentially leading to other buggy
> behaviors,
>  - We silently mask bad EC behavior.
> 
> We should probably also add a rate-limited print here to leave a trace
> in the logs.

Fix them in v2 [1].

[1] https://lore.kernel.org/all/20260702082745.1014968-1-tzungbi@kernel.org
