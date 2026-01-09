Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D0A23BF9F
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954667; cv=none; b=A0OiIMA4UhG/5aloZDNH4WWoEaF20m2nbdbeQ1GoJa4m27lMlrybndz6XMraXh8AuUE3RfZFtAVuSWBJmsOsEQStcxUzedc5XHP/E9njq1pszkyV3L9uiobW9wSI64ija4fEORnUnI69CgLehbuw5++v7q4gC1Mq1xwhxcmRtsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954667; c=relaxed/simple;
	bh=zDDwfQtnF1HziZxtkmsmfscNv0331XpYoakhHrBniDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AcJNAnwYw2rOTE8kknW2qWjzZEtpdnWzGdX+xdFYNrn4ag22i7ZoGiOJzXBrLlzwKkTTkT7Y/bc0/O43dW7a/eb+DA79X0/srpsoCRxta3lsjvOGC0Q9KjrgWKvaXIaKrEa6FgmTffZ2oDaWqV6NNlF2aYV+v9HJTscM70Pu46M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STg+EjJh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STg+EjJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767954665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fmV/NKJSbEeFZm+j3DpikZoea+NQWkrQbLuu4uv5h2A=;
	b=STg+EjJhrSnfeBTLsm5e7qP08aGLuZDi1YIWrOjtacN9tVc5TtaZwyMkKIvBsSKZvYrYlQ
	P7uXU4/FBFew7bysO8NGMoNaj5h3nFmUay1aS7ePP4GCqXuVU1PVXsL6tcASW2Ma0sUzX9
	T8yV+QK5JqqKY9Il/N64cxhlf4atNdE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-BGm0La-UMCuNrIxt8CN9kA-1; Fri, 09 Jan 2026 05:31:04 -0500
X-MC-Unique: BGm0La-UMCuNrIxt8CN9kA-1
X-Mimecast-MFC-AGG-ID: BGm0La-UMCuNrIxt8CN9kA_1767954663
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43009df5ab3so2614813f8f.1
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767954663; x=1768559463;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmV/NKJSbEeFZm+j3DpikZoea+NQWkrQbLuu4uv5h2A=;
        b=IMdReNgpUD6j80wokg0fhSNwMNODstqqx3CnCrWkrGzeNHT/noQDC5+fd/6KwbooL1
         IH6ATGa/2uNUytZkqR/eMzw6W49H40ZGNATqAkK4fOMBNGd0pOpaFiCBGOBuQmkIxo73
         5qzruixzwjDtGv55jbfJRQLsRAD7ZCHjrLqvTPR+1xJLYmQGWq1aDdFcfPdbofLaPDlp
         aV+UyD5qhvr4HXotBYDpqGmcboOraQZpusp1/zz0fsAr6pYfq44GCAwYSKyySuXNKUfI
         mYv3EH444YPH6zliRV/PWh7OXIef4edBmZmxhV37c+7YZI8pi+F5a+oOXW9TtkxhCf/5
         HXCw==
X-Gm-Message-State: AOJu0YzkJyHFuOqDHIm7n3PMVxS+FwQa4kKYvEfX62MXSTSuUvwgB9UQ
	J3CPbQBtTRY6t9oh8au2bBFpEA+1JAmhu9G2Lz2OWrVlmZhwzS9YaljCJjzUY7i7ezMZ4uwet/p
	Xd7qY6gpzO1d7aoqx+ADqKfGJcdf1qTG04R46e0XWD9eu6eQG8O1qZA3+Au1IvixGjlvYEA==
X-Gm-Gg: AY/fxX6Q18ByE260C7hm0/m+QB8g0TIRJlXXMzKiy9bz7H/hspA4uHFRxLimXHI9oMP
	TNfhm5GBG7bboT9KzuzDhESn2eb77BW+v8IPRs+Oz5HYf3COcR3ZQGexczEL/9AX1VE6H6PDZHs
	Na50J433Sr8XwOc22ysk0BAjWeKoTR83x56MxFTkhx5ERghlZhxQNuC/bMmvIoQHHAOUZnQe9kn
	S4uVtArIHSGY62CjN/5bx8HsyaiuaXRRAVSpvSI3xKgy+Qfmxv+S9llDuzI6cc2zh9n62mbPx+2
	dceSfzJa3fJWgROULFFLnyb6SsCKhGx2+nnyNhgnhje/oUJG8hhnmv/fXujK0zYla+uhiYq9j+y
	1Lcg4IZXxp+FkXTqgJpuQfx5x9fciYNy2+F3iQaFwfKYlCPryZbYlTp5u+KRPgbY2sjdm
X-Received: by 2002:a5d:5c89:0:b0:431:5ca:c1a9 with SMTP id ffacd0b85a97d-432c3632a04mr10938586f8f.23.1767954662757;
        Fri, 09 Jan 2026 02:31:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4nrg8QB5rJOCXc0Rpx794/pjF2RLlPnnPcBH896+5wFAzWM1R8nKWuTEsys28GWir314rrg==
X-Received: by 2002:a5d:5c89:0:b0:431:5ca:c1a9 with SMTP id ffacd0b85a97d-432c3632a04mr10938556f8f.23.1767954662306;
        Fri, 09 Jan 2026 02:31:02 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacdcsm21659038f8f.1.2026.01.09.02.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:31:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH 6/8] drm/sysfb: Remove duplicate declarations
In-Reply-To: <20260108145058.56943-7-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-7-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:31:00 +0100
Message-ID: <87ecnzf57f.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dx4rKajEx01xlWxxyv2ILZRw4KQ53PE7pf5_IMKeHN4_1767954663
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Commit 6046b49bafff ("drm/sysfb: Share helpers for integer validation")
> and commit e8c086880b2b ("drm/sysfb: Share helpers for screen_info
> validation") added duplicate function declarations. Remove the latter
> ones.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: e8c086880b2b ("drm/sysfb: Share helpers for screen_info validation")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+
> ---
>  drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 9 ---------
>  1 file changed, 9 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

