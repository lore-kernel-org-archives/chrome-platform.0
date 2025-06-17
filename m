Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25790292918
	for <chrome-platform@lists.linux.dev>; Tue, 17 Jun 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153043; cv=none; b=l4kwvFrcvSELlSJ9gbmOu5SwCca09za0+BVgpEHfRpWFqQqkiKZIn4BJgW4ONb7kVbWBK5Q31rec9zM6T18NCs7SFaHOftoVdbycOvP7ma/mR5pswGzCXZthlDuH/X4PkcfgNoQ9Jnz81vAR2xMhKmhIOYBIw8ifoGxzq9RH77I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153043; c=relaxed/simple;
	bh=YHPHcbEtKx3e1/IQVsfntHxD7KeC7qvG/QgbnDsiHg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7k/yHwXiKj7X+kxpLbe+yUZEci2p7oVbtjHh0EPttr1qFCpub0fJFG2x6wzKQS2enasnTfmYR9pKl0DMVuxbAIFgdlgvpR0a9lCrm32nlt63fpuCqMvGTJQ1CExU6KFukIB1rqB66aH1Q/gfwCuHgBNU7JjrATkAXzmT6tvmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=awP+AaWX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="awP+AaWX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a54700a46eso3519776f8f.1
        for <chrome-platform@lists.linux.dev>; Tue, 17 Jun 2025 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750153039; x=1750757839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQLWgJwCNGpOjHI3jmeKcf+m7mG0t5rZQIDZcAxVNp4=;
        b=awP+AaWX/kWNcutzxI9AOhvfwtELiXM4c2khBGxfJXbT0L2aGJhqR46MlqCHUeGYUs
         4FJ1Ff3TTWiVVRcgs8UrsPBQkdfl9eoAFKY2KOOWhJ9eijryU2+v54Gb0bC+eOLNpTIm
         ryi0sWRiYN1ufn9CQtcovkBMcKMmWri1DqQppKr0UI1/25d+9wv80m3NoFpcTyoxDjs4
         c2hScNPww9Bvg/18XbXhmSl337UWq502wFLBFRB7DGPdfq+kOZclePo/mWU4mfUXL1cV
         4ApDlGWADTTme1R5qK5EfONhssA8abR2OtANT0Xu6/tiU35CeqeLAXACxsRqfWwxJXTh
         URRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153039; x=1750757839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQLWgJwCNGpOjHI3jmeKcf+m7mG0t5rZQIDZcAxVNp4=;
        b=DgLB/4JjS8DyM4vZULLGn3x2yX2WCVS99eripRz8kehISsVaaJEqGbjMWCHwdNL/0v
         jYzzdDaerkLjnLfI+F9qsGUs+yoHxNd3hhG/4oTy9uaUMSGYh6yBxkyrEtsCj+G8OnUg
         iFSPSPGNfcN9B0oxfWV19lB2hkW5MmMVACKf+XrTz2usFDE2BmMN6xlQ5nLVhGbhwcvQ
         whSWlk8x6JnVbvYEmlaLURsvTwWIIoxnsM08YyNykfT2RPVBOlku+3Xpgt+ImZ36bCIG
         Zk9oZSdj6hvXrSgjoQXeUJm8KejgonKsNLN2dg4raeAS54V8PUeouDI8SkNJS3BJolVc
         05Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVz6U1cieqTBZvu/EmIseU2Bt/hJLgIMnE33D/0bdRQM4F6obXhBjIxBl3AyVfR8fkBr6e33mXd1A+LOfN0qb0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3yf54iQCecbuyV8GzK847nCc30zZLxi4J7kl7Hzrk0xFxeKUv
	FVEnhQUkHNkRfk3LMZFNY7iO7vrCmompKygeDdHMhtG6pYQqaAIb0oR+YJ5OoIfzXA==
X-Gm-Gg: ASbGncuXuCuhhFO69LlKnbK8+CuVFjx9z7Xqbr6jZCcjgpLGWc5eJeFoo9Q9/7UAamZ
	S1D5DvR0P19YNcB7W8qYypFWHA6yxD0W2XnP87Kpxk8vPYIQyo5pVjIXmIRcd4U1PLqTWlBdMlw
	DgBlKw5otyIIcrAPJhE3XNUONr9ZCIiN2n1mWhxszDivhmMrkXP4Vg0cVpjhlyC/5AhSsgrT6WA
	fu80W9Wem8IbWm73iSr6m0Ww4IHx+e7y1Nh1rRQfbln2W2iUMdaOQHe/rmnBJAnSYCxhn9hlbO6
	wvkvBqqGxSFd0i/GBhpdN6qxpxA0T0lWJi4LYIv9X/qYNVyloRHh0lxpQWCKxZ6TvYR/NmDH2q6
	gtsT8H5PDuMFPAySa1zIXk3GoYepxs5VZx+7rvC8lBg==
X-Google-Smtp-Source: AGHT+IFVAOAbd/qgKSVKbDicAB2PnOt83B6zNjx9qBCLEy9aEwwB0HmDR3fUYBp5jRLGG5xc8Apugw==
X-Received: by 2002:a05:6000:26c4:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a572e585a1mr9727634f8f.48.1750153039313;
        Tue, 17 Jun 2025 02:37:19 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a57b2bfc69sm7492985f8f.76.2025.06.17.02.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:37:17 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aFE3TVxqpt4-lmYP@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
 <aEtWtBKfNhDT1bF9@google.com>
 <aE1wvuamXqVTzpny@cyber-t14sg4>
 <aFBfcg7E38ywGD5W@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFBfcg7E38ywGD5W@google.com>

On Mon, Jun 16, 2025 at 11:16:18AM -0700, Brian Norris wrote:
> On Sat, Jun 14, 2025 at 02:53:18PM +0200, Michal Gorlas wrote:
> > On Thu, Jun 12, 2025 at 03:37:40PM -0700, Brian Norris wrote:
> > > > @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
> > > >   * boilerplate.  Each module may only use this macro once, and
> > > >   * calling it replaces module_init() and module_exit()
> > > >   */
> > > > -#define module_coreboot_driver(__coreboot_driver) \
> > > > +#define module_coreboot_driver(__coreboot_driver)                  \
> > > >  	module_driver(__coreboot_driver, coreboot_driver_register, \
> > > > -			coreboot_driver_unregister)
> > > > +		      coreboot_driver_unregister)
> > > 
> > > You're making arbitrary whitespace changes in this hunk. Try to avoid
> > > that, please.
> > > 
> > 
> > Sure, will do. It came from a style warning when running
> > scripts/checkpatch.pl. I thought it could be useful to fix it on the
> > same go.
> 
> That's odd, I don't see any such warning. Anyway, typically I'd expect
> such things not to be lumped together under the "separate your changes"
> guidance of Documentation/process/submitting-patches.rst (if they're
> worth changing at all), although that may not be a hard and fast rule.

My bad, the whitespace were not a consequence of checkpatch.pl
complaints, but rather running clang-format on coreboot_table.h
on a clean tree:

 * $ clang-format -i drivers/firmware/google/coreboot_table.h
 * $ git diff
 * diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
 * index bb6f0f7299b4..3d933c657535 100644
 * --- a/drivers/firmware/google/coreboot_table.h
 * +++ b/drivers/firmware/google/coreboot_table.h
 * @@ -61,15 +61,15 @@ struct lb_framebuffer {
 *         u32 x_resolution;
 *         u32 y_resolution;
 *         u32 bytes_per_line;
 * -       u8  bits_per_pixel;
 * -       u8  red_mask_pos;
 * -       u8  red_mask_size;
 * -       u8  green_mask_pos;
 * -       u8  green_mask_size;
 * -       u8  blue_mask_pos;
 * -       u8  blue_mask_size;
 * -       u8  reserved_mask_pos;
 * -       u8  reserved_mask_size;
 * +       u8 bits_per_pixel;
 * +       u8 red_mask_pos;
 * +       u8 red_mask_size;
 * +       u8 green_mask_pos;
 * +       u8 green_mask_size;
 * +       u8 blue_mask_pos;
 * +       u8 blue_mask_size;
 * +       u8 reserved_mask_pos;
 * +       u8 reserved_mask_size;
 *  };
 * 
 *  /* A device, additionally with information from coreboot. */
 * @@ -112,8 +112,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
 *   * boilerplate.  Each module may only use this macro once, and
 *   * calling it replaces module_init() and module_exit()
 *   */
 * -#define module_coreboot_driver(__coreboot_driver) \
 * +#define module_coreboot_driver(__coreboot_driver)                  \
 *         module_driver(__coreboot_driver, coreboot_driver_register, \
 * -                       coreboot_driver_unregister)
 * +                     coreboot_driver_unregister)
 * 
 *  #endif /* __COREBOOT_TABLE_H */

Anyway, I am not sure if it is even worth changing, its rather cosmetic. I
removed these changes in v2. 

Best,
Michal
