Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9D52DFA22
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749767906; cv=none; b=LO2YGkbf5rKAHJhQFiWoX27ioVEXAzAOF51hZaC8DWwJl7XxvGxE/yw+PwG4kp78KfyolNv/ITk19wXQWj0LH1yWZ0sig+j6DrOCBwDZiVj8Wz0F7IyBE8tWHl0Da6VPGgK5a0gpPG4+aWN0Jtu2tqSUYbh4LCms/SxyeLK5/w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749767906; c=relaxed/simple;
	bh=sztdsTy4wa87P27KIh0T1takdVyve9oLKd7HhMANHuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM1Gksv6VFNKOnHiH9cV3pd/6iXeT0KBBSQEWHxTBZMaNSp3vLcZIqaLn8FWkLd0PatwGzw703F2tkW4+KJS3K5LjWUSXs4lN/MdC0X1M77mzXtO+YMpE94Zl4RqUiQxK9nD8qky6mAT72y2lqryMAxf8AA7r+3W6zXcOetZbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m7+8PG6i; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m7+8PG6i"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235ef62066eso19508785ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 15:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749767904; x=1750372704; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fda6FxdHT/voycTXa7lxHxxCOeerrK6XiPZedwQDUNg=;
        b=m7+8PG6i3qkrfqVn8oIqG37UpK5EA5Thbz37B42+Z1K3qkjJkLhvw9YMs4dFycSdda
         uBDfxpmclKNrsq64EUI4UXL3lnRJuJBdGTovZSm1x3sRr/xX/2Spe00tbh8uV5dyYE7g
         xwhtT2Er29FRR4aDmEgRlornJVfhViCchDCL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749767904; x=1750372704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fda6FxdHT/voycTXa7lxHxxCOeerrK6XiPZedwQDUNg=;
        b=pMep5JDefGCW03a38yt6YYQPjTy7A3mTjk8wnIqZMKt15P37aJTyWr94ttnPwFSwCF
         Gt5Q2Lprn/2KC+1/3ez4IxM5qWhc+CsG4Bnydo13Zib24LqDTzfc0GFwzqMNGoAZRa3t
         M6GUXc/QmkI7Aylb9DE252MCsCK7Uvf6YRNBwGlMJiFNaRXWv8x8JWQF/Tg7ECCxzquO
         XpCsRNIg1T/ZOESjg1Y19jOYg70MdKhoVCoU5whq5mb8n6u+Lxmcw9pxDsegK9AJ/3AZ
         Ih3WhHVNHV2twRBuJ6DRCqqP9sqY1rN8msqSh5aYa+5JmHeGkxEt07EhdwZ9GSGNiWgv
         LOBw==
X-Forwarded-Encrypted: i=1; AJvYcCWW9+yRsWRUaK0yaw3qE0nUkbdvAPXBhMUorU4g/cw6/GaS/OdnX7FEFxnlNIURLkSdF/40x+1YuNGpw5FFTTk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0zlmhyizAe43tYYeMIIV1b9d3kpVfbYO96hSZ4mLZjxytOLOm
	V7JCRaIRIp8j1KF8MJuCRvotHToxR7iwZYVA2BfMeUECgSmGN43wJ3bPGM5GWLZ0rdDHivyK2Hm
	zI4A=
X-Gm-Gg: ASbGncsTX6xd0NEQzbivqyS/EmgHx1TMmuTmbT29tTSwlnwQEeYEb/VMn9YzLJehWRz
	onsWQoONAVyqZiNdBSl119DIxh4kF55JSwxBIKKO2cfRyqY37AKIdV0QO32KrXge33A1qm8JrhL
	0FquE4l3XFke85aY+ZYGT3IAXlc4DufLjm7BI2y0MT3dnACSeUBJxqxygCcYYxo8sHzzL2OYn2D
	kM/2KL+FwiokjkCIv0uloeR6tEsRKoae+NAgjHs2HWUt3AmUXgnSdj0Ol6QckmxzDsJ1k/Qaba5
	1v/XWgcKgYFDKioAMiMNrRZ2Zs8IQbd9QsLP5wNHybCkWhxhCJqjr+c2VJtoplYZzKzkfYFPnVV
	hbgsRr5zmCEvpMnjZ+Sj0XxES
X-Google-Smtp-Source: AGHT+IHNrBQDYFUbwAQiVtbeP7J80oAQ5zRsvtDdeTdUWMr9CI9SHerDWzXPw5mfWEBomTlmMULilw==
X-Received: by 2002:a17:903:b50:b0:234:ed31:fcb1 with SMTP id d9443c01a7336-2365d8c55e7mr9712975ad.20.1749767903699;
        Thu, 12 Jun 2025 15:38:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9a04:ac66:831d:e4a6])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe164406esm301867a12.27.2025.06.12.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 15:38:22 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:38:21 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aEtW3e7mwjTTvfO9@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>

On Thu, Jun 12, 2025 at 04:05:49PM +0200, Michal Gorlas wrote:
> Places a blob with Linux-owned SMI handler in the lower 4GB of memory, calculates
> entry points for the it and triggers SMI to coreboot's SMI handler
> informing it where to look for Linux-owned SMI handler.
> 
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/firmware/google/Makefile    |   9 ++
>  drivers/firmware/google/mm_blob.S   |  20 +++
>  drivers/firmware/google/mm_loader.c | 186 ++++++++++++++++++++++++++++
...
> --- /dev/null
> +++ b/drivers/firmware/google/mm_loader.c
> @@ -0,0 +1,186 @@
...
> +static int register_entry_point(struct mm_info *data, uint32_t entry_point)
> +{
> +	u64 cmd;
> +	u8 status;
> +
> +	cmd = data->register_mm_entry_command |
> +	      (PAYLOAD_MM_REGISTER_ENTRY << 8);
> +	status = trigger_smi(cmd, entry_point, 5);
> +	pr_info(DRIVER_NAME ": %s: SMI returned %x\n", __func__, status);

Don't print this kind of debug stuff at INFO level. If you need it, use
KERN_DEBUG.

Once this gets attached to a proper device/driver, you probably want
dev_dbg(), if anything.

> +
> +	return status;
> +}
> +


> +	/* At this point relocations are done and we can do some cool

	/*
	 * Multiline comment style is like this.
	 * i.e., start with "/*" on its own line.
	 * You got this right most of the time.
	 */

> +	 * pointer arithmetics to help coreboot determine correct entry
> +	 * point based on offsets.
> +	 */
> +	entry32_offset = mm_header->mm_entry_32 - (unsigned long)shared_buffer;
> +	entry64_offset = mm_header->mm_entry_64 - (unsigned long)shared_buffer;
> +
> +	mm_header->mm_entry_32 = entry32_offset;
> +	mm_header->mm_entry_64 = entry64_offset;
> +
> +	return (unsigned long)shared_buffer;
> +}
> +
> +static int __init mm_loader_init(void)
> +{
> +	u32 entry_point;
> +
> +	if (!mm_info)
> +		return -ENOMEM;

Hmm, so you have two modules, mm_info and mm_loader. mm_loader depends
on mm_info, but doesn't actually express that dependency. Can you just
merge mm_loader into mm_info or vice versa? Or at least, pass the
necessary data directly between the two, not as some implicit ordering
like this.

> +
> +	entry_point = place_handler();
> +
> +	if (register_entry_point(mm_info, entry_point)) {
> +		pr_warn(DRIVER_NAME ": registering entry point for MM payload failed.\n");
> +		kfree(mm_info);
> +		mm_info = NULL;
> +		free_pages((unsigned long)shared_buffer, get_order(blob_size));
> +		return -1;
> +	}
> +
> +	mdelay(100);

Why the delay? At least use a comment to tell us. And if it's really
needed, use msleep(), not mdelay(). scripts/checkpatch.pl should have
warned you. And, please use scripts/checkpatch.pl if you aren't already
;)

> +
> +	kfree(mm_info);
> +	mm_info = NULL;

This is odd and racy, having one module free data provided by another,
where that other module might also free it. Hopefully this gets
simplified if you manage to combine the modules, like I suggest.

> +	free_pages((unsigned long)shared_buffer, get_order(blob_size));
> +
> +	return 0;
> +}
> +
> +static void __exit mm_loader_exit(void)
> +{
> +	pr_info(DRIVER_NAME ": DONE\n");
> +}

Remove this function. We don't do prints like this.

Brian

> +
> +module_init(mm_loader_init);
> +module_exit(mm_loader_exit);
> +
> +MODULE_AUTHOR("Michal Gorlas <michal.gorlas@9elements.com>");
> +MODULE_DESCRIPTION("MM Payload loader - installs Linux-owned SMI handler");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.49.0
> 
