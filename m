Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B14156678
	for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 21:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263845; cv=none; b=BzF0vY2zYw6IV6gNR8J7EdbGNQ+WKKh1owUOco83/lr08CKqENaFBTuWv0LIb4s3aTKTtq0OJXdzqdyEHYp56Y8lm7LyhNA7IfAUNRwx8rwEqOJlMlesjbSqp7e4VgwY5EBy63CVpknDKa3bGkpqQnf/Koi7Ks4hPUqjWs3MoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263845; c=relaxed/simple;
	bh=tfuYSo+KLHIiUv/qhXVqntL2AmcHjqzefmKj7MGAWFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YbAw1qaMIiX8pQN6b9VaQwIb/7bnmnn0Z+Uo/NkSuC6Ny1P9RKzBltUeu9e8DNzXjMePlsv32I1ZmhfFEpVLv3dUXxaUPYy6rq7mEbIoXSMsC0ZW/TscWTQAH/W3w5214T6KkIddCQM3fpX9McQgRD56W+acKyk+hOVAyOppkUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZBkWMM4x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBkWMM4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726263842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fKkSG8VqZnRHGkrVPV+pI0HT1H3VA+Urh2h620VqLak=;
	b=ZBkWMM4xhXXyEtPrV6WlEh3eW6Tb7BBiPF9CQlsnF1A3O48dmWkyjFjyS6yZbfd4vdmzC5
	nerci9WPXsIiPls0c5uAhZNZiZFaQYGC76nQATHFTwaGB0CXm73suyGSx2eQhCPlVGDRdF
	tbJedhdBXPGzrLCDHLYvPEFgMrDDzQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-oybBGFbuPT6uqgwp1JVSBA-1; Fri, 13 Sep 2024 17:43:59 -0400
X-MC-Unique: oybBGFbuPT6uqgwp1JVSBA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cb830ea86so18555855e9.3
        for <chrome-platform@lists.linux.dev>; Fri, 13 Sep 2024 14:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263837; x=1726868637;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKkSG8VqZnRHGkrVPV+pI0HT1H3VA+Urh2h620VqLak=;
        b=pxgInVS5Vp4LY6aZq0XK6CKrkPVYIr1UX5WSf5qdhAD1/sZr32gywUgl7TzNqhjGdb
         ScE8DNNUnZ77Kv1PXjfwxhOyeAn3PDt5t/asLuXuAGpQ0JficE1NuHbvfVPkAaKh3zCW
         UaHTx8036qOueta5aMwSh+x3n1KzVn55OARpuegkqsLCJlgZix1lbbxte8kS4C+F9qxm
         1dh05kYt+MyHyzjTwQOGDCgmG//u7uk9YRBUDd4hyki9kBX0gXJ5/avM4NMpdNtfvt2y
         xdRuHIOKeRbhwnC2YND5YNJjJmchUzzL/EJMBfaY4toRqRiwQ5E7/W7fpQF2nMaNj/M9
         3DmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXstrZmRFeLO3jIeYeGWqg8nqWppcD10avI40brtqw4F1UfW8812NSn1U63ZW4qVPZWAozLaA1v100Kc43eCq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOzN5viyccbZgjf3cujiKHTxAP2/uvVbjyovuyNFXTi5VJqHbe
	qYMoqog4je0+CshZg228/48+0q8J1mH+xAnuPFRolOPxCqM4RXAgR0B0j4Mp/Q+/xPVstD0Gq2U
	M9ABCxDzcgNQ6PQIRwezcmYg8Sm5n4zTqwtOt6hDOfDdR7LntumbqtYB3Dy0kPTrubw==
X-Received: by 2002:a05:600c:4e10:b0:42b:a9b4:3f59 with SMTP id 5b1f17b1804b1-42cdb529b15mr63531195e9.14.1726263837567;
        Fri, 13 Sep 2024 14:43:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmgVixelwyphAF04b6dZiaPA5Oxiya0I3gktrct+B5i0gL94h0PMPytDOlN/HdvI08wJsm+g==
X-Received: by 2002:a05:600c:4e10:b0:42b:a9b4:3f59 with SMTP id 5b1f17b1804b1-42cdb529b15mr63531025e9.14.1726263836950;
        Fri, 13 Sep 2024 14:43:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da242736bsm2598215e9.40.2024.09.13.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:43:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Hugues
 Bruant <hugues.bruant@gmail.com>, Julius Werner <jwerner@chromium.org>,
 Brian Norris <briannorris@chromium.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Borislav Petkov <bp@alien8.de>, Tzung-Bi Shih
 <tzungbi@kernel.org>
Subject: Re: [PATCH v2] firmware: coreboot: Don't register a pdev if
 screen_info data is present
Date: Fri, 13 Sep 2024 23:43:55 +0200
Message-ID: <87h6aj6xgk.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Julius Werner <jwerner@chromium.org> writes:

Hello Julius,

>> +       /*
>> +        * On Coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
>> +        * in the Coreboot table should only be used if the payload did
>> +        * not pass a framebuffer information to the Linux kernel.
>
> nit: The official brand spelling is "coreboot", always lowercase (even
> at the start of a sentence). Not a big deal though.
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
>

Thanks for pointing that out, I wasn't aware. I just posted a v3 with
the proper coreboot spelling and your Reviewed-by tag collected.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

