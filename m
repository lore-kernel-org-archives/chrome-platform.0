Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6599230FC03
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 22:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343549; cv=pass; b=q8X7pQ1taHTbhrAzr2rFAG71Fwvlp1zmpZ4G8yLboaPr6hAcAvELrUOcsmZfDkhKczbnoOwtbkWXsveyguXD4v37J2nISCNbQ49kicI/7I9pZxgLpSzZ7auOfU46r1TUYnPZdKgh9Y+LSXCPC2dr+XgsNGIXyg+QLJMs/rJbiGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343549; c=relaxed/simple;
	bh=stS8jfVrxCa/0DnWgmw3A4qhPZi/vlQunJTZIlJuCI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIHlnQ4fpci4Xyyia0OtgW+htoLi21rRiJRmYkTA6zQ6VUwLvVlRYS6ffriVJLmP3qUhPtEAOaAW6/2LWUtzmx6EZrWrOcF6aXAfkNr3jcYY+4PlYR6H91Qooot+I29JQYuDORhnj3LTwlXiPPmWQ2FihRcNYpqnvf1Ta7hR9QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Op6e4IT9; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Op6e4IT9"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee243b98caso67191cf.1
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 14:32:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768343547; cv=none;
        d=google.com; s=arc-20240605;
        b=UuohxaIZBOGJhmhNNdaZX9tWNIJJ7sgpf++vM81b+DkPfXR6ZRufScR/+7hQt6S0rW
         3T5EnIng4OxVhC0o0R7w7EytqYPyEXxVD/5E3mG+IFx/u1CzKUBOsQGfACBDDA5djdlS
         GXvm803Z9/EpetYm2C/dBUCsU7rY7ta1V28CAGKtbx9H32yMVCNERoma/322WMvVQzzy
         yARz+qoI45nsuTo3gRWvKjXkDZun4ZOYHKssA/Eajnh1T6tHQDHMDFZiMlLI5l15RwKP
         wFn/SjN5vOo5zTLrthnuSOlEq2SQdm6e3gIu6K9OOO1XXLytdU6fUBn4ywjWIgEP90JR
         v89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ab17K08SO2fM+NNrfoDXH6PR5Yemfuf3o30RLIzOWv4=;
        fh=T05yCrPAbrv/r5HfWhw3QD0gnCLPn1L/1mK+QJhP3as=;
        b=Q+kj/FedZx2WnGawVBpzPBMmwQ2WtMbCkLRQO5924Iu1aXtrF0aqABxTn7wVq9RcZr
         kf1cXMrKjlg+bpJYyw2jfjLHFCmel+nAQ0pqTbNHKIrXZrhMBQGePCnXSSAdzEYywioq
         ntHIzHnbIlgFY2cLNLwlbQ/ekERBsUVHbPEgQmC0J0kPmo3v5wGD5oAccB+mWqlZHKyX
         uVZATc8MBrfOER9nH1h9s7cfi/vO2vui4H3KLovNgsnHuPNcaI5G7AlvQOBMcX5SOv/s
         7mAgOTWmEONGse0YTolodQgbuXm/NVSgkSVJFeHVbbXnHQsMlNRtUcsLNHh43+sAk8a/
         ZYRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768343547; x=1768948347; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ab17K08SO2fM+NNrfoDXH6PR5Yemfuf3o30RLIzOWv4=;
        b=Op6e4IT9mMaVmUbTrcDQdZW7DrZkrYbU63mO6vhynduvQY07Ftsks4yLVGWao/hbtb
         7+4jIqBPr5Z4rnUc+KQ5t+mUIkRgagRmIObBCEk9aKs2ULuG1EW/LUksFqhtgjyR1NYW
         WbQOwEzCGrTo/OF08siqQla10LdoSfW/1Ujeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343547; x=1768948347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab17K08SO2fM+NNrfoDXH6PR5Yemfuf3o30RLIzOWv4=;
        b=gFrue0mi/GyBRSYhlaEN2oL+LkZcYDe18foZTW0s/kfBIspDwRDZz0zOZurn7sjh0y
         sZ657u6rFhT+8cc1zPPfhLd5hZmSmG16FKlGeffyrpM3nKn0BZnW7BTNLepk2dAoGgpT
         x2Vt16uqxFPqBKZBC5eVbwo8c1gXBUzzzYnraaKyOkZUKRATeJPIEbf0eLOfwKrR0dGA
         5219eR3sHjZKT4Ht+Xz02YZLN0X48gkOAQwp6Hvuiwg2aszxsUDZHcZE4ERlKxVm/7VO
         3QkCQ1peepOuyzyUIQ+elhr6cz92mN8eOP5LFBFcFL5c56+mswqKuE/wHSfjmkvm0d7x
         QI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbYasvlCieoZMEK/fDSYSFX9W48LEeEWrY9FEEvktf32bDWk3tWVtuvwLpyPXAE/YbvFptH+CHkGZ/+OXniNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVxAVKl7jt7h8c/VY6PKPab3anhLSeyVsl0LGvYuqXcncwrIod
	ri6D4cjIIPWSMVhZqeu7ObLaWiR+EsYLDKnBVk+f2YBPYCi945NuceZtvSbBXYKWm12h76t5HN2
	/qA+NgTqbCQe0cHlXnrHSNy5gNV4cLio6/pTPBzZb
X-Gm-Gg: AY/fxX7wECV69agHUL9YLro+yHfHWSVS7bs4C20OfOhkYowTOdiDea9Kvz3vUKMO+0m
	NAW+3HmKTsJStw9/NTH5Y1g725h/MaLjDGzMPSglynv5Jnl1ZQvdPC+JsAUYFuTqychRe0jxoln
	wMr3VBq5TAWodiby8cQpTrKYaKioJs1kF/mzBQ4EF+zY8RPWHDjFC2BuYqONL/dQyWRd53JUoB6
	tPdX7fJFcombzmoTwEXwOABJQyOThnA0DpTp5FrTsK0qoXtErqDogGnyb2JMDQEreMH9uy63ewc
	FCGw3Hu1ye5P66U9wiybtPlJQQ==
X-Received: by 2002:ac8:5749:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5014929462amr1227031cf.1.1768343547085; Tue, 13 Jan 2026
 14:32:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108145058.56943-1-tzimmermann@suse.de> <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de> <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 13 Jan 2026 14:32:14 -0800
X-Gm-Features: AZwV_QhxgOTj_PD3P3RVLyHroyuj_4kHgIHlMmfS6qcWceT2Jbt_9awD63NnODo
Message-ID: <CAODwPW-JdJh1QmyMWxoZdaXKTE-y0n5BRSZPaj8Ntszyu10OuA@mail.gmail.com>
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
To: Javier Martinez Canillas <javierm@redhat.com>, Samuel Holland <samuel@sholland.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Julius Werner <jwerner@chromium.org>, tzungbi@kernel.org, 
	briannorris@chromium.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> Another question I have is why there's a separate device for the
> coreboot-table? Couldn't the kernel just create the coreboot bus and
> then populate it with the table entries? DT does that. If the
> coreboot-table device is really just the parent for the other deivce,
> that is incorrect, as I describe above.

To be honest I didn't write this code and probably don't understand it
well enough to answer that question (we should probably CC +Samuel,
who did). I assume that it was done to get the automatic matching of
the ACPI/DT entry that tells the kernel that a coreboot table exists.
If there's a better way to achieve that, feel free to change it.

> * the check on whether the CB_TAG_FRAMEBUFFER should be used or not by the
>   kernel should also be there (what Thomas did in patch 1/8) but instead
>   of omiting registering the coreboot device in the bus, the device could
>   be marked as "unused" or "disabled" (by adding a field to coreboot_device).

This sounds like a reasonable compromise. It still feels a bit odd to
me that the check whether other framebuffers exist happens during
parsing of the table rather than at the point where the table entry is
actually used by something, but if that's the easiest way to make it
work, I guess there's no harm in doing it there. (I'm still curious,
though, why can't you just do the check in corebootdrm_probe(), and
return -ENODEV if the other framebuffer is used? Wouldn't that be
equivalent to what the old driver did?)


> * the coreboot_bus_match() function then can take this new field into
>   account and only match if (device->entry.tag == id->tag && !device->unused)
>   or something like that.
>
> That way no device will be removed from the bus and the corebootdrm driver
> will only be probed when the device has to actually be used by the kernel.
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>
