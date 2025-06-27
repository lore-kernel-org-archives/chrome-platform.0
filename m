Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9521B9D9
	for <chrome-platform@lists.linux.dev>; Fri, 27 Jun 2025 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024465; cv=none; b=cVXVhakfT7chi1Q7CH2QochOqEpMzI334AGLKenbUKSO0wCz3m/EAOI/2TUNzpwVTquy2gGa3pK/ekQ/S82Z/pACOVVTKWpFK3bAl0MuINyTIbdkOGOc/4KUiR2YfnmC6Av8ZKbEJUjFerARuXb4Nc4+QtcSuYrKBo+dsFKK4NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024465; c=relaxed/simple;
	bh=fl5PplXrSvYrXkPFIRlB9i9CTn2b94Avf8dhkd9p2/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOtkpzAR7c7DfM//eFp4t1ZmdSPvlqeThzBkW/sPpU1ydXE7ZDR+iiatvm8D0v+ea7quFnDUZXOfE1sVroAfudarLklTlea5HQCZW3ZLUW/RWF57yGsNCwQORUb5RbxavurNoEfSz/iHDTeLp4D9d4/8+9XdXFmaLzJwEid26rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=a+6G6/1w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="a+6G6/1w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so19542675e9.1
        for <chrome-platform@lists.linux.dev>; Fri, 27 Jun 2025 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1751024462; x=1751629262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+f+ZsWg0Gmymqmi+4OUAMPiH1U0HhSSc/DH6fljnhAA=;
        b=a+6G6/1wbhZ3TbqcTNxnUifM4sl5j8h6nG5wPn+RH+Fp0llSicO9lSIkFoUa2083IX
         e7BiSDRqxapM2/nL1WM+nKYXOwcyUQHVtEJT9MfvCW7gT9HALAW7k9E6Bt5h+jB6/Hoo
         lZ+xZ4AOuoWGIIQRcB1Era3FML2aWIwDzu5W9rOaiG7q2G/y+JeBckfEIMsSfoB4Z8UC
         Qty5C9scYF9wm02Ib9Ds9tKbsLke0E7ehO4rgYpi6CWNT5OC/Oz9JMGcNwNKqDRKP4OQ
         LrrAn9/2nD1LBvY6vrYpjReW3/UUdnLUImuHMy+m2UP/RNwK84Fhlkj1jQhSnUnR5Cod
         v+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024462; x=1751629262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f+ZsWg0Gmymqmi+4OUAMPiH1U0HhSSc/DH6fljnhAA=;
        b=seNv028AnEt0AaA6RMHnN3oGfbrjvFBqckaZ3s0oM0geKnEYVPsQwFjnjupZpg6Po6
         lazhVviQEa6DhRI4LFQM4DgIy/JKbGwlIajuA3Bzrr8LRdtDCZjQGNA5ChbNbK1ovvWo
         eGpSOPt1DHHj6tApt6l1Tjn45cuQ4QFknR9GbZTtQwoVDd1PXmYyZQbR4z5xRQliPVYA
         p8672EDzxHrcn2zLwqc5atINn6ret7tPEtFEvYghfHrGsuryXDCnUPtp/PdfGWufKLO0
         bKn1IrV5OHwEWPjRyrqHjhumWOuBYeN/vyGE+aXT0RU2oc2IPgdV6UccK7Kkq/++Um8/
         EmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgn7r/Y5hKwXjHLilh5ncnFq02gTZ9c5YVPT5pTDs1PPUcq1AgODrSpTjFJAn4mvTOQD87chnibMtebKZcJCQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaiuXR8S6kh+Wf+Mp0ginBijyr3icEhu7/DZI75PFHYXFuJ+Sv
	vNGbJTCSpvYmfVJfJMaFD9DV1LraHmmgghyeYxXm4doMIG0EWGDsZcA7j426yJPj4Q==
X-Gm-Gg: ASbGncuFDC1HrSMwrd+quYMgP9mW96b9tWthVMKWk4LQgNCMt8cSEJAhhczyxito/sS
	j1yraNs6XJxGQwZ7/hqjMPt59M9YoRJwfY8GQiVMbSeEVn1K8NtpBUeBLi2WutvCcP1NkttVCh+
	OfL7izj0Ac0j7b4S+JGQJBa3tESWS1opKxSAEcopDrPAAJjK1kFr8LQrcf8zojtKgMGPUDiumhf
	Hygbry8gIOM9UTkvHrRfRTfVSIIFa0J6Xo0pIVWK1MlIzVrcAIKl30yY5NxDQCHLUuu28HG77LF
	oj+7WyvtKlWoyvjt2GmtfC4xXUDR/ZqgUsba+bfPxcSkPUIzo7x7drdcW+tQPiOI4fdMzh3RRGJ
	MLuTtj1nwRWy66as1BTvvSAhCe8ECwakucF5jORR4Kg==
X-Google-Smtp-Source: AGHT+IE5U0WFB3xmAQyJW31NBkdohL+E1I8yjzg0yul66CSK8NPf4uCADLUurvYUtJNKZDRdAmrH0g==
X-Received: by 2002:a05:600c:a40e:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-4538f8836bcmr21511545e9.30.1751024461841;
        Fri, 27 Jun 2025 04:41:01 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390d3fsm49139535e9.1.2025.06.27.04.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:41:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:40:29 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aF6DLQfKq-bpEmnr@cyber-t14sg4>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
 <aFvq49ODR3XfcwZJ@cyber-t14sg4>
 <aF0x-d-uBbMQxrxO@cyber-t14sg4>
 <aF4GsTGNSHQKn7Ms@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF4GsTGNSHQKn7Ms@google.com>

On Fri, Jun 27, 2025 at 02:49:21AM +0000, Tzung-Bi Shih wrote:
> On Thu, Jun 26, 2025 at 01:41:45PM +0200, Michal Gorlas wrote:
> > On Wed, Jun 25, 2025 at 02:26:11PM +0200, Michal Gorlas wrote:
> > > > > +
> > > > > +	/*
> > > > > +	 * Gives SMI some time in case it takes longer than expected.
> > > > > +	 * Only useful on real hardware (tested on RaptorLake), not needed on emulation.
> > > > > +	 */
> > > > > +	mdelay(100);
> > > > 
> > > > This looks weird. Are there some ways for Linux to be aware of the SMI has
> > > > completed?
> > > 
> > > Not in a straight forward fashion. On Intel SoCs we could read MSR_SMI_COUNT
> > > [1] before and after sending an SMI, and wait till it increments. I am
> > > not aware about any unified way that works for AMD SoCs. However, so far
> > > none of the AMD boards supported by coreboot was tested with MM payload,
> > > so to make it Intel-only in v3 is not a bad idea.
> > > 
> > > [1]: https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/include/asm/msr-index.h#L880
> > 
> > As a follow-up here, making COREBOOT_PAYLOAD_MM dependent on !SMP
> > resolves the need of acknowledging SMI completion. If SMI takes longer,
> > Linux is just stalled until SMI handler gives the CPU back to the caller.
> > I think for this case it could be the way, LinuxBoot is by default
> > compiled without SMP support anyways when used as coreboot's payload [1],
> > [2].
> > 
> > [1]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/x86_64/defconfig
> > [2]: https://github.com/coreboot/coreboot/blob/main/payloads/external/LinuxBoot/i386/defconfig
> 
> To make sure I understand: do you mean the trigger_smi() becomes a blocking
> call without a timeout?

Short answer: potentially yes. Longer answer:

 "mov	%[apmc_port], %%dx\n\t"
 "outb	%%al, %%dx\n\t"

in trigger_smi() will switch CPU context to SMM, meaning, current state
is saved and CPU starts executing whatever instructions are under the
address stored under SMBASE register. At this point, Linux has no control
over that CPU, which can cause chaos, particulary on real hardware.
I am not an expert on how the scheduler is implemented, but I can imagine
it will assign next not-blocked CPU to execute the instructions coming
after trigger_smi(), while SMI is still being handled on other CPU.

> 
> I may misunderstand: depends on !SMP which also means it can't use on most
> modern architectures.

Not necessarily. This driver is useful only if Linux is used to be
coreboot payload (aka LinuxBoot). As far as I know there is no real need
to have SMP enabled there, sole responsibility of the LinuxBoot is to
bring-up remaining hardware (similar to Driver Execution Environment (DXE)
responsibilities when booting with UEFI), and kexec to the OS kernel,
which is likely built with SMP.
