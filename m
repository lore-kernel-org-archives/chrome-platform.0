Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179F25A2B4
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954276; cv=none; b=pL80froLdWKotU9ic7jaGSB0ptwy77ZGROVw/auEQs5LVig1yf7TolH/o7dwZELviD0TXCLfTsezzv/70fL29rLkP7BlXJR1lXnu3+SSTx0fOMWhD+ncalKZmC2fIx8uBbI5Gb0l48qaN3RW+H56oMDhxYSMf2gbEttqvnt7hT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954276; c=relaxed/simple;
	bh=s0LKmjVi1nBfXsi+FrjWFNBZx8/Gwybp6m5l9P3L9ZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZdYwhnlpg/uC4z+blQwY4zGsUM6MMEmOKPlG0QFCGfDtdTKZwWI3/OGdc8TzQir9M7whE8/4q1voeq3r7ukJxMjrOI/+xhtq3v1Se3M0HddwG+lSH68mMF1g1jRfkwLtLw5UHtS4qXHv1briQq79H8A/Nz36AUjMxbTo2jYJm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9fBAgPr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9fBAgPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JQvmww697RmYgNbgSJPddAKm66fAzjXixmMH1peMtxg=;
	b=R9fBAgPrXdCLgPyIt3JSR0sTT8hpCGu3LIfAEM0s6MInefx32R2YodKPamEGHItliNle2p
	1dCDUg8CYMntSw3tzEIviE9t1BejHxDvPkvp+sTeWUBszYul/gLbMlG0/Onwrnfa6b2/vc
	CJDVgDYNu5NXDxRaBbqzM9MOJMYr4dc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-2e76PD5KMFiEGFMb15IUqA-1; Fri, 09 Jan 2026 05:24:30 -0500
X-MC-Unique: 2e76PD5KMFiEGFMb15IUqA-1
X-Mimecast-MFC-AGG-ID: 2e76PD5KMFiEGFMb15IUqA_1767954270
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477b8a667bcso45525975e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954270; x=1768559070;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQvmww697RmYgNbgSJPddAKm66fAzjXixmMH1peMtxg=;
        b=JreZ9b5//N0h2sFDPTbV/Ylj/2Ot36I08UYLaS7k2sUjG71K6XxerMd4C2vAvz/Kld
         f3i3oiBnNYOAZL6Na3KKSTEnCLcMXHw3l8QvKgM9ZMk9W1DG08uYBW3iz42v8iadoL1I
         +1NEBDfhYQT+nUj+pKM363yIleXVD0cnuwq04PRV9688fCY3XqrF2IFAAgcZTXBm5WqA
         lV0hHGuWO/a8MLxkJ1f0IFKNa5xphNYctC3i+5GKqczwKJxVhWI761X77fPt5wlw/CsE
         I2Mnm8C8ciot3oraQHYMviFSD5bUYdEwhCXGAmspu+g5Oyv5REO2uCjrDxGGziaa7GuK
         Wexg==
X-Gm-Message-State: AOJu0YzTYkwd7SbyJodsqSUw+L2xwrm0IaKo41VVF//tfAluA3bl7zPL
	XX6f7/jWzK4DMz1SHrI5CEYX9yRGwtE02Bf4DbO062N4bS7iNeM5spgh+RN3/GPKwby/G+JdUvO
	LVzMgH+mtYEecFLfaw2mo96qD00Q0yZAqf6sKKBDRsZ5BamLXyKQXAUYhnhdYglEIvsWySA==
X-Gm-Gg: AY/fxX7wLOHJIIWk9LrvOflpGTrE/uXWYJID5ByQZLAkvXQSI0/KQ0MwDXCWFpcByPF
	HCsPri+JPt4J1kKKNrV5Y7lRZHgTVOS627qRMfUf9yBAWE2+Advyi9u0czcjhn3KLwajSkbgyJY
	2tLt5kkB0g1VkhSE4Tf0hztxBmNAjc4IoLDaGClaDp/vLCSSLEiRh35LA9YP6pY+du4zjvwjxWQ
	yK1es2NeTHlCiDEXGCOHtPQWN0ytc6Yg67RrZEGHMDtjCrcc+CP76wkXtBEMif40OGm78Q03YZc
	xRXUm009fFmlRewyGpQlXrPE35FiVrA6Is3mMUo7jTequrP3ESVkEVYXoaDd4gioMbL0o4xhEye
	hMfeYcAuKxezaZklDUv84OLUw9XQsqWgHSriBMrKx0Ko3msWnqr1TKOL/1sU85RApQG0A
X-Received: by 2002:a05:600c:3543:b0:47d:649b:5c48 with SMTP id 5b1f17b1804b1-47d8e4a3c73mr45535665e9.36.1767954269670;
        Fri, 09 Jan 2026 02:24:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfja0QkpLtMucWBszQZG7txsdgUHemD6EXdIkxatnoeEzMv9HOuQQ6ZvXn6ogvp4kk/JRB/g==
X-Received: by 2002:a05:600c:3543:b0:47d:649b:5c48 with SMTP id 5b1f17b1804b1-47d8e4a3c73mr45535385e9.36.1767954269324;
        Fri, 09 Jan 2026 02:24:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef868sm197989235e9.11.2026.01.09.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:24:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] firmware: google: Clean up include statements in
 coreboot_table.h
In-Reply-To: <20260108145058.56943-4-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-4-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:24:27 +0100
Message-ID: <87o6n3f5ic.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eQ7333-r6Es-rkPC1WAJNlXXYVBId5FKtYBAkmyx5N0_1767954270
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Include <linux/mod_devicetable.h> from source files and only forward-
> declare struct coreboot_device_id in coreboot_table.h.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

