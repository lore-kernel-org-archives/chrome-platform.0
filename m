Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258AF1B963
	for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475788; cv=none; b=XKZwJhmvWMhBXU3TbyGTqF9S8wvvIDg+/I6pB7rYANnfcY/aBMhmFBIczteiNkTEq9c45myZOcTCtUyk8+cci/PadK9GFL7LpCDlAAOln9dGR1lADON5sfhcafZj8sn5qNVBVpxp17hptcJfyUEO+UZU59ruJZ5zdkjyAen21pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475788; c=relaxed/simple;
	bh=ExwIcThVvO+7ZAUVFxCZRYWIdFsONsYB9CaICjRnUgU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ucwmaJx6lWUlD6xftAh/0jOu1WF0VooyYrWN040bclJ/uMORUqdxCdVPI/zRo7ZhPZ1nR696KmaU+xAS6QyBVjvhXXHalAMonyG/iE4LQEUvTbp/CfGgB13yOElBBmArLW1zQq4MMVkLbTlGJFKR9GuzxdUhMnsMh7s4cF5w3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xz4OHicY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xz4OHicY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726475786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZghuNl8RSxhnXryd0EQnOpNodf1ePXadDKLScPEidI=;
	b=Xz4OHicYetMR0XuOwvwxsaRFx2F4xM6ynnukJWYqbxj0pA0NKZreD4uiZEIcY33io8jpvp
	PR2a1vrmnhmNgK/cVnTTTUW8FEb4tWJso4Yww6CsdlRqy2plU5xi23L3f4RG2sCKjYP18X
	Yrk6VjTgSljWs7eS28zbBnY/vOsHEls=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-paF-Wj2uOkqP-PA4eGeEAQ-1; Mon, 16 Sep 2024 04:36:24 -0400
X-MC-Unique: paF-Wj2uOkqP-PA4eGeEAQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3771b6da3ceso1063289f8f.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Sep 2024 01:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726475784; x=1727080584;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZghuNl8RSxhnXryd0EQnOpNodf1ePXadDKLScPEidI=;
        b=T6Q52NZp3oH0yvY9+FLOlImoI+LIiw+tNH3Of0DHHsqcyF17PQ1/z1PGq5PCIiUwBf
         KaCW/AMyxspuKuS7YCZ16pyUnuS1f5G6OkDUEN6clwbYUJgQ6dmH/R9HDc6yjU1FdO+5
         Nz0s70jGbaK2wcODH3NrJqTy6+R1bc5yJc5PI96S1ce+3Szp3GVNIsTFVWsqW7VIYAgu
         JO4CTeIYvLlyg6jSra6OlKsMjdVV+wtIaAUy0Zppb7nuQyIehqs9ZUerLEs8XMq2jMbL
         SjwSG8EWPq7UMUHRJgBl5ffsQf7x96uJRF6egd8JIwfcp7SuxmfIxOV8SyVy52SfLHGY
         vNRg==
X-Forwarded-Encrypted: i=1; AJvYcCURskf5qK+U+fpgz5MVP7oxY9+OyCgbQnEcwWmdUOaI/Dze98+wb1K7xtYzoMw/2CR8UXwP9y7vbP/hFYqeTqw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn+Zagnb4scjuTqY3I01M/HH/0D7zTfzkiiPQnVvSHcOfzJ0lI
	XkxtV1t3oY5RBRdp31J9c2nZirH4f83Hl6kuQVQ6kcC2DzPhAxTs8On3jl8iW9UVdykLVyt+ud5
	5OHQATTz2RjxRtRBK63rndHqwdvg1u4qZmEFVxR0WcLZzBW9agUZhocD6jVxxGZCNhg==
X-Received: by 2002:adf:facb:0:b0:374:babf:ac4d with SMTP id ffacd0b85a97d-378d625360bmr4960086f8f.58.1726475783577;
        Mon, 16 Sep 2024 01:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeUS2MF6BwNmrHrtyITHuRjTmMKPOYmdWcd0GIjcbKqPN/sItyo4uvsPMndSeuH50X7fkZOA==
X-Received: by 2002:adf:facb:0:b0:374:babf:ac4d with SMTP id ffacd0b85a97d-378d625360bmr4960068f8f.58.1726475783006;
        Mon, 16 Sep 2024 01:36:23 -0700 (PDT)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net. [159.63.51.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e49d5sm6620646f8f.17.2024.09.16.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:36:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot
 <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Julius Werner
 <jwerner@chromium.org>, Hugues Bruant <hugues.bruant@gmail.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v3] firmware: coreboot: Don't register a pdev if
 screen_info data is present
In-Reply-To: <eeac1c3c-4a21-4cd5-b513-8e55cffe0bae@suse.de>
References: <20240913213246.1549213-1-javierm@redhat.com>
 <202409151528.CIWZRPBq-lkp@intel.com>
 <eeac1c3c-4a21-4cd5-b513-8e55cffe0bae@suse.de>
Date: Mon, 16 Sep 2024 10:36:21 +0200
Message-ID: <8734m0atbu.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas and Tzung-Bi,

> Hi
>
> Am 15.09.24 um 09:44 schrieb kernel test robot:
>> Hi Javier,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on chrome-platform/for-next]
>> [also build test ERROR on chrome-platform/for-firmware-next linus/master v6.11-rc7 next-20240913]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/firmware-coreboot-Don-t-register-a-pdev-if-screen_info-data-is-present/20240914-053323
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
>> patch link:    https://lore.kernel.org/r/20240913213246.1549213-1-javierm%40redhat.com
>> patch subject: [PATCH v3] firmware: coreboot: Don't register a pdev if screen_info data is present
>> config: riscv-randconfig-001-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151528.CIWZRPBq-lkp@intel.com/config)
>> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151528.CIWZRPBq-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151528.CIWZRPBq-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: screen_info
>>     >>> referenced by framebuffer-coreboot.c:27 (drivers/firmware/google/framebuffer-coreboot.c:27)
>>     >>>               drivers/firmware/google/framebuffer-coreboot.o:(framebuffer_probe) in archive vmlinux.a
>>     >>> referenced by framebuffer-coreboot.c:27 (drivers/firmware/google/framebuffer-coreboot.c:27)
>>     >>>               drivers/firmware/google/framebuffer-coreboot.o:(framebuffer_probe) in archive vmlinux.a
>
> Not all platforms define screen_info. Maybe fix this by following

Yes, after reading the build errors reported by the robot I remembered
that we had similar issues with sysfb, for example commit 1260b9a7020
("drivers/firmware: fix SYSFB depends to prevent build failures") fixed
one of those.

> Tzung-Bi's advice of removing the local variables and then guard the
> test by CONFIG_SYSFB. If SYSFB has been defined, screen_info has to be 
> there. It's not a super pretty solution, though.
>

If possible I would prefer to avoid the ifdefery in the driver. I also
believe that the local variables makes the code easier to read. But if
you folks think that's better to drop them, I can do it in the next rev.

Another option is to restrict the architectures where this driver could
be build. As far as I understand it is mainly for x86 and ARM64 arches.

These two have a screen_info defined so the driver will build correctly.
I can include a preparatory patch that adds a "depends on x86 || ARM64".

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

