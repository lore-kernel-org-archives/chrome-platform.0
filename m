Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104924AEF4
	for <chrome-platform@lists.linux.dev>; Thu, 12 Sep 2024 16:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726157033; cv=none; b=eTT9It873N3Soli6RH5PNyJ5pSnZy21rwNbvUl3uHPLpdvQJkOs0MhNW913OoLMKx65bs0R6Y+Vqw9KPveZ2U24cDxKnuutM5INptMVJ3DXIkQ/Z8WKMySH3nFHuP+75ZtZZokvgkkj5LEUC2QAPjWufonAkkpS69QU8wGs6oC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726157033; c=relaxed/simple;
	bh=CrCjW0ic6Db+J3kjsTPKwgfDJbBARSVIXo7Ekp4qkxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuM85qdyqTWjgR3oRWPF9qpio25phP5dUPaMnm0Te2E9+1wJ3/8Wh1Skf39fT6PdrGnDOhK/Qhd79iX0d7sPM5hbh3iWg3VeGD7idkag9yDWLfBqvHhwQvb8Ycnj+ec14t5hgLlnZebPa+uOXIeRiwaY8BwozWAlpdkhH8P/Bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H+sKgj8u; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H+sKgj8u"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4582b71df40so273691cf.1
        for <chrome-platform@lists.linux.dev>; Thu, 12 Sep 2024 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726157031; x=1726761831; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CrCjW0ic6Db+J3kjsTPKwgfDJbBARSVIXo7Ekp4qkxU=;
        b=H+sKgj8unx4DlM1gnvxPLIrlUH0T/L6j9dHDmlS8aVORU2N7QkwvjgfvyYZ+CLih5W
         n4n1feWCEDeSgs0f2JXPtQIFQrlM9iCMhsDoueetXMB3ZSKD0nVyFID9fUi6da0Q9T8/
         QabOjRSKYqEqhoccwmiNn+rP45TdxjI1imSE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157031; x=1726761831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrCjW0ic6Db+J3kjsTPKwgfDJbBARSVIXo7Ekp4qkxU=;
        b=s5TNX9Jsl2OJzPz+6oeW9l/I9Xh6yBbBWf+26U6YF2gNl3stXIVeMmnJ5uViVVz/nc
         /d5zrep2YKzZgPSX83IPlRUG/LmmZDl68NlYKgE0Q/SF1IstyWEdXVz8dn60165lgoLi
         BufyftMRz7HqQoAhTHuohDkvmLiQLryYJCI/wCSmEqW+RCFbS18VG8nasxugT1pKNlQw
         po4VvOsiMlygVTmpTLQH0x398gtz3i4hseUaCcufSC9N+fe5O9sDQWBWouKOkgyk4+LY
         pENJc0OI+6RBZ4JzTxi7V3WwmXB3GywOAWwL7U968Orv0+caoL+URc9yOSXap1gv/uSI
         ngjA==
X-Forwarded-Encrypted: i=1; AJvYcCX7k82GihxTog79rdBH4v/oejH1UUHryvqiRctBudB2Jcb3KwUEA6e0YFWHguiCe8pOXUkI90ridE1SjXzogUY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw54fC/zJenGa6ogucn2+HPzABnHGRoOcTGAtXgpHCEBs7vnZI4
	Jpe15Q7ZvXyIpRSr9cKhWDm8F0INsKab/Te2Vb8H6lHMV6FPtX7npblFrO26p9dk7t+Qna09kbg
	wIXFrFKQpRgqDf0lLHYZ/tpASnB6HL0KVTirM
X-Google-Smtp-Source: AGHT+IFQu3yAL5DEk7oQCeXw0JvR4PFs6pcDDf5vf1OMase0DRLjYTPZIp+SdT/fDhzrb2YiYvR+LjfvMad1ROIciKA=
X-Received: by 2002:ac8:5845:0:b0:453:5f2f:d5d2 with SMTP id
 d75a77b69052e-45864403792mr2236481cf.1.1726157030402; Thu, 12 Sep 2024
 09:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
 <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local> <ZuCGkjoxKxpnhEh6@google.com>
 <87jzfhayul.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87jzfhayul.fsf@minerva.mail-host-address-is-not-set>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 12 Sep 2024 09:03:34 -0700
Message-ID: <CAODwPW8P+jcF0erUph5XyWoyQgLFbZWxEM6Ygi_LFCCTLmH89Q@mail.gmail.com>
Subject: Re: [NOT A REGRESSION] firmware: framebuffer-coreboot: duplicate
 device name "simple-framebuffer.0"
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Brian Norris <briannorris@chromium.org>, Borislav Petkov <bp@alien8.de>, 
	Hugues Bruant <hugues.bruant@gmail.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Tony Luck <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> On Coreboot platforms, a system framebuffer may be provided to the Linux
> kernel by filling a LB_TAG_FRAMEBUFFER entry in the Coreboot table. But
> it seems SeaBIOS payload can also provide a VGA mode in the boot params.
>
> [...]
>
> To prevent the issue, make the framebuffer_core driver to disable sysfb
> if there is system framebuffer data in the Coreboot table. That way only
> this driver will register a device and sysfb would not attempt to do it
> (or remove its registered device if was already executed before).

I wonder if the priority should be the other way around? coreboot's
framebuffer is generally only valid when coreboot exits to the payload
(e.g. SeaBIOS). Only if the payload doesn't touch the display
controller or if there is no payload and coreboot directly hands off
to a kernel does the kernel driver for LB_TAG_FRAMEBUFFER make sense.
But if there is some other framebuffer information passed to the
kernel from a firmware component running after coreboot, most likely
that one is more up to date and the framebuffer described by the
coreboot table doesn't work anymore (because the payload usually
doesn't modify the coreboot tables again, even if it changes hardware
state). So if there are two drivers fighting over which firmware
framebuffer description is the correct one, the coreboot driver should
probably give way.
