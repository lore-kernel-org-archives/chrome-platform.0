Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C553382CD
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954406; cv=none; b=tMEW65ik60OUz7eoDjRS0iY2P9YoQHscFZhQMiwLbXh+17m1WvFTyv8SJapXX5EVyS30TRPruPQQ0kguxf7mXffRN9DM0MZ75YHrMaaOa4Np7qcs7994p/+obKTu23tx6xImp2ioA/vCVdlIbxZ8r4W1/Rx2aPz6jRydnNxc8RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954406; c=relaxed/simple;
	bh=IOaA/EKmMqi1igmgntLmoInlg5cLSkzJC7n+2+6JsPs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ACXN8XifeiWx+s9EqBPw/pB1JtdNqp1O969VSI+zlXkfI3FZR7EHM8kAwzQn1339aL6y3KkyfWRx3M9woRwRgciqsHcxC3RgA67qcYodktDr7Wc2vL/4Yocr1CdHJxUK6rR16uA2cy+D/HP6lg9oMlnZx1pLpSHZP9Xvpi6a3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FOYUkv59; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FOYUkv59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f/w4aAW2SrMolYvW3866mfnxV74MsG7+xai45acXkT4=;
	b=FOYUkv59CNRAQ8fLza8xI62C6g9PkF9GIzsQ0DsgTMpoKCXrxrLb6lTnajXXFtrOOeHknH
	h2+prDiPNrdthNKQ0FXBCeNhSOKJfe4dt+8vY2zJGOl+CAFXW/7d1cZplZIJENA+WPT3xH
	UsM7UpvoujgUI/if05hGfynpHqOmjXw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-NBBOxyWxMUm1Jx7EWpJMWQ-1; Fri, 09 Jan 2026 05:26:43 -0500
X-MC-Unique: NBBOxyWxMUm1Jx7EWpJMWQ-1
X-Mimecast-MFC-AGG-ID: NBBOxyWxMUm1Jx7EWpJMWQ_1767954402
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so27952515e9.2
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954402; x=1768559202;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/w4aAW2SrMolYvW3866mfnxV74MsG7+xai45acXkT4=;
        b=qUlM06RL+PbXw2mQ+6JAzs89lGh5tQWwvUcyze5G0eaEMgPIm7iwfQowPBUJhe9SLI
         lnBBBF3dkEyz1qnZ8dTua+yJC8lRnkcWyZXMglndlNNedXg2wPLEkqPHE8jI7i3U+VF6
         LQ7KvECrT17y7R+qKcS9iUITqmjhsXmExmsljF7/90mX7ZS39PQ3VkiPZwp7LL4uvzha
         yE4QHRC+Pj+ouvsnPRW4emEjE6Ooh++W+ZDJ50YQNBO9mvDDgx7WiHPSvPDDfDL+ySIK
         zoEM2lgrStly8LDYVwkhtg8huIOANr9IYWpJNwYmjVI56BupalSpepkCcXI2GGwfoJFV
         3x1g==
X-Gm-Message-State: AOJu0YzhTExcipKVCvMk5BtMHXllSlsccEjKS25JlziDalyw5tiiuokI
	sP58gV/xJ74XZvc+Gkn+ke+y3NkGTkqVgFhwBwG44BDRdjnZml/oDpewQ486CmsmmdH3hwaa7KR
	6vabDDWBFGn8OGMKEo4SwGg2MJDE358WHK8THyRi1UIbQQld21UPMjYtzKDQEsk5TzqSATQ==
X-Gm-Gg: AY/fxX4adsMaydFImY44MrIWnYfNFK7z7QVMNjVY8UmwOTCAnuJt++AX/IZAoWcS9rv
	92tdZiMMvu+HLj0TZtUOt7F8fre0SEQBcUBx//HxLszUUqkBlgfWY/1ZzF7Y5fC5OUpmupW+Z1t
	j6TnXQB9GaK8JJ7GvVvohD2zI1btaje6FoanqQbSpkU8G4Lusoz15rRaMhDq/ALB1/pZZ5qYmE9
	riPQU0K7mRGqBEwnyHZ1Kb82CxG6BKdFdyY+jJrmMSDZ2Z8HmmNsNAjnrijGVjrGoZvijFCwPTV
	kLZEN+M55HENUIBPJF/RXEHuYr4ZSqDM4T0/0bueGyRGXC0CGByejfsRgEYEazUwvtB1X+cVUlO
	/0UjRJ8G9i8QRe1/JjJar8FBa6SV8zCMGemmJMKNuYGEDeBluwLAO/HCtSM37O7EoyjoJ
X-Received: by 2002:a05:600c:3143:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-47d84b1a14emr111811145e9.11.1767954401678;
        Fri, 09 Jan 2026 02:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkCLyTJfwI2U2fven5BTIwjrPF6485bf2UgTi68si039XftNRiJ1TVtPhLUgaGU8nsyouMSA==
X-Received: by 2002:a05:600c:3143:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-47d84b1a14emr111810845e9.11.1767954401283;
        Fri, 09 Jan 2026 02:26:41 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm22022397f8f.38.2026.01.09.02.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:26:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/8] firmware: google: Export coreboot driver and device
 interfaces
In-Reply-To: <20260108145058.56943-5-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-5-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:26:39 +0100
Message-ID: <87ldi7f5eo.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kcQllu9qjcc7gRlnaLmuqh8onAg1B_eC4qdrmrwK-fE_1767954402
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Split coreboot_table.h: move struct coreboot_table_header into
> coreboot_table.h and the rest of the header to include/linux/coreboot.h.
>
> Prepares coreboot for allowing drivers in other subsystems.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I think that patches 2, 3 and 4 have merits on their own and could be
picked by the coreboot folks without the need to wait for discussions
about the other patches to settle.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

