Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCD333436A
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954103; cv=none; b=MRF2L2bpdhIjol8hRDwySsWeXvHiSZcPrkwtfhsiXR8hmHp7Z4tRsw2N+krbUKWYWCzLj6u3+cB1OdFeVefs6lLOb0JBbYW9u7a8y4S4MzjOssvNXL7TRzNps4d1hNgbgPnrDKAahmInUz6BqBsquq8wQUwFliWvQewxpAKo0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954103; c=relaxed/simple;
	bh=j66FNTsKpilKur7Dez855Bxydrl+wxScDGy7Hr9iYek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QzpJwfzq8HjzYoVROFhjhvmmEUTjZuu/xsMpObucaTzZ1suhoA66k05qNGgVyaJN8Z5xHRoLlfEV1ik/ymjS8E+kaKsbIRsJlcXt+JCW3oOQwSfkbetFC24X9FrpnJRprxRUSLsM9TwB7PDc7ELnul+EqCXB/U16url8bDUsjoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SiITk1La; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SiITk1La"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FezN54GYPDoxnsyXbOv5BiaITQPqN2z+3NnISchCk/Q=;
	b=SiITk1LaVaNco5I5gy7Ya5odyQXiWD8xGjSoH1kewxL0e8OMtDI2w7BlTvIdwDjPhqUxWJ
	ucfDdyMhl333xr5Axtt5AqHuSolC0bMHRv5zT8d5bRYi0zHbIz8ubbpzhzszwTEBKay7Qd
	S5lhO1+2eEYk2GZiS7j3FFkULonRSXM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-x4-w4gKqNGmoA9wIev5i_w-1; Fri, 09 Jan 2026 05:21:39 -0500
X-MC-Unique: x4-w4gKqNGmoA9wIev5i_w-1
X-Mimecast-MFC-AGG-ID: x4-w4gKqNGmoA9wIev5i_w_1767954098
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43284f60a8aso2395555f8f.3
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954098; x=1768558898;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FezN54GYPDoxnsyXbOv5BiaITQPqN2z+3NnISchCk/Q=;
        b=sWkrgUEQMd6M7HXKQ4cGpAXpKz/nA3EklOUqx+/EqfqJTu202RSn6caFUv92FAf5OU
         0z9Ocia/q+vFQTJvPVj2rcq4Z3C5ffsZ6+VnwJH97HExft/L8R3BSrZo3C4Y+kXSMYYn
         G98qDP2kzsrMfanSdWHeMjgkCxDJ3H/C8OaKtPHhoYJlhpZx/ep+dZIMMmrho/XVyVYF
         wqt6YfS3Yp+s2uOVoIzveavKPxCI59HbFuFMbNqRVsVwnkCnfFhF698JzAPyXXn4gueA
         1UcC3GpvEuNplMOBkOvanxFPH078f+unE5f9v4L+uZ4LDNRSfiXem13Nv+jtFLCZYEEQ
         3xXw==
X-Forwarded-Encrypted: i=1; AJvYcCUpQxVse6Tkd42gnKiyMBFkqGa83NiuPJEDD3BfKE9t/KcISL/2HeA+r9AklsG4IGJakuKmjfw7cdxFlqCgw+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgwgM8MeKSb+aUdHwwHmHtFFP16ds0EpeU57ITMaPF3H0ibkRK
	AH7bw/ri7e2t5xSgJCN9MytRuvMcJJ/y3NUxKceHJk2GGigggqytf7s3tzMux7D50z73/PdWlux
	LhAXwyacIjmhhOenYFV0Vda3S4G54KGD1xrZ1SrUr7NU9sHxUDqsUhSFK3/jVfYFTyzZHzQ==
X-Gm-Gg: AY/fxX70zpWqSFvhFd86OF/3azMnhMzsEiC75JiasSYF7XXddcGq8wJ6ea5jy13Z4vV
	RJYSTmEh30Me9mkkbni4P0wYwdYi6zZvwFl4n3vOjpI/hligBI24n95PKX09VUEAZeJjv9id0/G
	sPfzgpS9ed4yLo5/HtDoj1+0T8ZnjUxf+AFZSq0TO5eimcKqomGv47Vl69alQV6XtyXlXFmmXm7
	Wea/Ln3S1EBenstc8XWBz/ECS5SxDdqj1ahpjLVBNh1XmnnXb9dvK4IRAAowijHFM4JVVhDV0C0
	k9E/RyWLPt6f1LZaOBTQ/KkFb7rzlWR6R+aZeLS42AhVemHTjHYWjrUrLV4gNR9qlsRbNgECYL6
	EbwpTo9ckUkNRH6cGDsgCX9KKdiJc/cWIiVzJoS7MoKS9kulvJ7WZG+O3CGV1QFagmUpx
X-Received: by 2002:a05:6000:258a:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-432c36280damr10902028f8f.3.1767954098354;
        Fri, 09 Jan 2026 02:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtCX+SYG3wx1L2Yc3dj54o790Re1VGvFH2eZ6tg5FAB0dllrthP5tvWIarRl51Mjjd7wi/qQ==
X-Received: by 2002:a05:6000:258a:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-432c36280damr10902013f8f.3.1767954097964;
        Fri, 09 Jan 2026 02:21:37 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e175csm21406436f8f.14.2026.01.09.02.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:21:37 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Julius Werner
 <jwerner@chromium.org>
Cc: tzungbi@kernel.org, briannorris@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/8] firmware: google: Do sysfb test before creating
 coreboot framebuffer
In-Reply-To: <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-2-tzimmermann@suse.de>
 <CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com>
 <9d9015fa-aba4-4dd7-a024-563f58b7f43a@suse.de>
Date: Fri, 09 Jan 2026 11:21:36 +0100
Message-ID: <87tswvf5n3.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tUO8OqAnR1O9yK1U89OzYsC641XpDZ2-aSgJDmgxMgM_1767954098
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas and Julius,

> Hi
>
> Am 08.01.26 um 17:55 schrieb Julius Werner:
>> This seems less consistent to me, although tbh I don't understand the
>> Linux device and driver framework that well. I think the original idea
>> here was that the coreboot bus represents the coreboot table, and each
>> entry is represented as one device (regardless of whether any driver
>> actually wants to do anything with that entry). That's why we're
>> creating a device for all the tags even though most of them aren't
>> really interesting for kernel drivers. This also helps with inspecting
>> things in sysfs.
>
> We need to distinguish between coreboot and sysfb. Only one of these 
> subsystems can handle the framebuffer. Having a framebuffer device on 
> the coreboot bus, if the underlying framebuffer is managed by a 
> different device seems even more incorrect.
>

I'm not familiar with coreboot so please forgive me if something that I
say makes no sense but IMO what should be done is the following:

* coreboot_table_populate() should populate the bus and devices for all
  devices. That way the complete device hierarchy will be exposed in the
  sysfs entries as Julius mentioned.

* the check on whether the CB_TAG_FRAMEBUFFER should be used or not by the
  kernel should also be there (what Thomas did in patch 1/8) but instead
  of omiting registering the coreboot device in the bus, the device could
  be marked as "unused" or "disabled" (by adding a field to coreboot_device).

* the coreboot_bus_match() function then can take this new field into
  account and only match if (device->entry.tag == id->tag && !device->unused)
  or something like that.

That way no device will be removed from the bus and the corebootdrm driver
will only be probed when the device has to actually be used by the kernel.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

