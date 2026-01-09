Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB08E2D5A19
	for <chrome-platform@lists.linux.dev>; Fri,  9 Jan 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955057; cv=none; b=QZy72OAhv352h66WEfqISaBc7clUXHgW/Wd6xs7d/J7G1Rh7TJmY5dBPfgYSDGesQAJYmn02aUWDMcKR/we6wYmW6V2XRqdrObXiuY1rnWRUUMEKyy5KRcbpWJui0aKAwNw6i8JwaAfTDNCy9n3XmSPr6eCnoo7o5DqEtWLmnBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955057; c=relaxed/simple;
	bh=qrIEp/l0K6ka8h752ICWD8wzfk1p282cjEfjAmMczBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sE84cQfEFlyg3L7HbHXN8aLMiPcbL5NvH4lF918A9NjLywAMoUa28ZOx78L80Wq49ZI9E45NmaW7g9MdgtkakSDUIjKLCSdbNxXiQrPEHPiSoJZBdieaeaKmD8+kwdm6DM8WS+sYXkwzU8B9vnzYZUvlgOlzYy6I3JR/oSM0DCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghVcIwm/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghVcIwm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767955054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipuoDX2rtJ56VEsP+6WugM42BQVThpNDN2xp89WYaWo=;
	b=ghVcIwm/NZ8/u/dl1+ShSDVwT27zANdd+nJ5chLj2IxWb1covuQUsVDu41DgawCLPMkhat
	j+mTgopUM3UGNWLmvQu/q+jNYCgifeVkS6PmVBgJdnjvr/aKeqKjENzQA2pGXuU+E+tqNF
	5/J3lEramwrCxkkDn4CuvwrVnLzk72M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-I_4U4TSYPlaI7QOv-NwrMQ-1; Fri, 09 Jan 2026 05:37:31 -0500
X-MC-Unique: I_4U4TSYPlaI7QOv-NwrMQ-1
X-Mimecast-MFC-AGG-ID: I_4U4TSYPlaI7QOv-NwrMQ_1767955050
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477c49f273fso41555845e9.3
        for <chrome-platform@lists.linux.dev>; Fri, 09 Jan 2026 02:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955050; x=1768559850;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipuoDX2rtJ56VEsP+6WugM42BQVThpNDN2xp89WYaWo=;
        b=DyOtkHozophhJEDCM3jN9ljaBKgX2gv/w0XLeFvO4JK5wwzxoGO0WRW3nBUc4/ksIl
         KvX+Da0x5g69WQEa1FH59/M/nvPyFAX+Eu6fd0tcgrql0ynsvOFMFU5sr6Axa5+qZHWa
         7kvRgJSyqjXSBLBUmkI73nFe4TNi9d8Gy8wux1lyOLw4vyX2oHlBHs6IKJwB3Oa/JnJ8
         Uu1tX4ioX46mvuW2r81TuIQGjMS0CwM9ygQWnVn9pQiAJwltHMj+J2DlHDbahEf4+W0L
         /iuSl+TTzymNxpWOgfW+zuVrhgfguHhHl3vjpKkTlOXkoY+aaOq4pU6koeiL6042lsJ5
         JY4g==
X-Forwarded-Encrypted: i=1; AJvYcCXM1XlIiJu6qIDNNnGTsHXZewionXwPh9i2+AYvbROgfdUIARoN2PVCdsSbIiLtbxR5lb0+WgHYycxTfvZxYfg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqsW2sH+d4gACrlYBWLU3ti/cMRkXuqNPz3HpWqJqhTR5h0oIC
	TCSaU67U3R4katqZAXvOim0VzF/WwhLwpTaM6TnAKgzCe+z2AJPX9Uu5c445+NYBszJFwJzEnij
	ZWsMwDFVLl8H4QqvNqvgUe4QYc1+E7k+rWabpliUXyxT9CV3+oENR9u9aOcQjiBsbR5z3Nw==
X-Gm-Gg: AY/fxX4+pjcnIeiX0Yc+a3urVRd6ymOA9QOonLppFgAIxnT3FolzbPc69/+Y5sCI7ou
	SDW5eQ1Z/HTgm4oHTWdlsSNokz/adUpuE3u/DQwcIRobM5936xiEE942FmSs4FWAJS8acF+UaAL
	gSHThSQ45UPlxlA1aXNijRcw3kc+JqGsFnAnhFPcMrEMg06tiI/DVHVsRE+x5Yvizu8IWL3VB78
	NGGmF6WChZ6m2aQnXEQdMd64fyJFNBiQboEIbOnbG1yJSMa9ahCC1Lfp3k4Pdfj1FaOHekQlIzG
	2GLjqgrHl8P+SwlF8czApWfBNqGS4dI6mbfnxKGfVv+fdwpcKUxOMU2OXGlSvTh4RyeuCAXDbRT
	9tAlwbCGDhjsO120OHukw9NMkqXa/HmL4/MaIMk8IHSHIzHuoewWH+1oH2SUHdU4Wuuqn
X-Received: by 2002:a05:600c:8b2c:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-47d84b1849emr110853885e9.9.1767955050352;
        Fri, 09 Jan 2026 02:37:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETCK7XKY5/aWdQyBTZZ8C1HEHfaJgnGTLB3Vai329iWuwNw67ymEzlG9XniABoH2eVUx9ipw==
X-Received: by 2002:a05:600c:8b2c:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-47d84b1849emr110853625e9.9.1767955049923;
        Fri, 09 Jan 2026 02:37:29 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8384646fsm167654735e9.15.2026.01.09.02.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 02:37:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Brian Norris
 <briannorris@chromium.org>
Cc: tzungbi@kernel.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, chrome-platform@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] drm, coreboot: Add DRM coreboot driver
In-Reply-To: <8d1b915c-b1c4-42db-b941-cf62613c17bf@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <aV_zKzBth1TJNFvJ@google.com>
 <8d1b915c-b1c4-42db-b941-cf62613c17bf@suse.de>
Date: Fri, 09 Jan 2026 11:37:28 +0100
Message-ID: <878qe7f4wn.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5NG6Oj2wUiRaV7rdkoE9l29MMy2YuikTv1Wx--YmB5Q_1767955050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 08.01.26 um 19:10 schrieb Brian Norris:
>> On Thu, Jan 08, 2026 at 03:19:40PM +0100, Thomas Zimmermann wrote:
>>> Coreboot implements framebuffer support via simplefb. Provide a
>>> native DRM driver. Keep the simplefb code for now.
>> I'm not much of a DRM-er, but what's blocking us from just replacing the
>> simplefb driver with DRM completely? Just being conservative and
>> allowing flexibility? Or are there technical reasons this wouldn't be a
>> proper replacement? It sounds like supporting 2 drivers provides at
>> least some small complications, like in patch 1, where you're trying to
>> avoid repeating similar logic in 2 framebuffer-handling drivers.

>
> Yes, that's true.
>
> There are currently two drivers that bind to the created 
> simple-framebuffer: fbdev's simplefb and DRM's simpledrm. The new 
> corebootdrm intents to replace simpledrm. And simplefb is deprecated: if 
> no one uses that any longer, I'm all for removing coreboot's current 
> framebuffer handling.
>
> Best regards
> Thomas
>

As Thomas said, simplefb has already been replaced by simpledrm. DRM
provides a lot of advantages over simplefb, for instance is a KMS driver
so one could start KMS apps (e.g., a wayland compositor) which is not
possible with simplefb.

And as Thomas said, fbdev is deprecated and likely going away at some
point in the future.

The real question is about simpledrm vs corebootdrm but Thomas also has
explained why that change is an improvement. Then simpledrm could only
focus on DT based systems and have dedicated drivers for EFI, VESA and
Coreboot system framebuffers.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

