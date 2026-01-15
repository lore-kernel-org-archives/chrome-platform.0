Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290B21FF46
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510481; cv=pass; b=OI1dzP82keLOdi/4r1VmycGeYPwlhut0oirJKl5k7JS8PV/ViLmalrWdthDKNUN3p4F2CixNfL4iBemwi93e91rEkZI+cGwa4MT1qNi1zL0G2rG/jUZ0fHE1N1i7ur7AHjauk28I9bRCyvJIDVlCWe1zyJgaHaVp4XuUdTLWSAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510481; c=relaxed/simple;
	bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWhsfh5Ogldv0bU/jS/rElvW1bGOVXjd6ENUqs/CX+M+y/J6xF0fJjutZTGvQmDBywa5VhHc/aw7mfcvy4JXb6PXCOrKnMfZfR97teGLn2PbmGADDw10MNk1CZMgL20t4FnCtGdz7YLMQZMq/DRX1OXA9cl0JHkQPlw044SJogQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k5j2GJDo; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k5j2GJDo"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-501511aa012so72981cf.0
        for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 12:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768510479; cv=none;
        d=google.com; s=arc-20240605;
        b=iFxUsp498IazJqQiEtF84FUTkQsMNB9nPIGG/De1NmXFnDMuK2JUTPKc36MJch4b5E
         BrPQTklrE6f1Hxfg0n3YIxAtTvD+K5JgXyZfg3eeVB93yxQcekIIAJdbRmDqIddhNFxq
         wbmQiDjPcTp90JKDhlLtKwVn3Fsg8ndU/SIin/bKauk7xhqWM4i0az2JrU6mQpbC99Lb
         Z/+pieFnYPoNXfTrCeH8caYczmqe27tz5aCsz08v47Z97Nb10t0E0ztfkXlaAeKSBQWm
         be8Nk1vUVj2CRETjWds58E0dOEhM9CZIaopugrrtw1sNtsTNQm/nqYE3r7MJfNYMcDlm
         g7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
        fh=c3F59AA+4W2iZu5DZpEpLDbVzxTEVQ9ujNvQODHEZqo=;
        b=I9I01G/y7BlSqRSlz6LCc/a5JzksKCQ/kliYnCpwrN6VAYtkl0Bgp6RSiYCTbnYs1V
         JmejFgcKzUGwbrkpCaLNHGe8qOzkXAnen2pNtQahOJt5IktHC4NySu8y4hng4YiFE4Ws
         KFUN2gFfW4Sw+lKn3FMIQ3tyNRmM2EBmBa51miFWmT5Qh7zPq4YN3UkaL77q2Rgd8owb
         IoJ568AvwmJMs+EJrDfAB3EiUhdm1jyD2ELHDtslvjPtvlkXO08uta1mgitX5xgYTyBp
         /rXtQJNVUkDEDiAkylsyeySlV5j6wc+5SRS1hHEqFJTAxwO/GY4b2xRHgzDjmprdT4mg
         2t1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768510479; x=1769115279; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
        b=k5j2GJDozRy71sUpC7lwQLQmwdVZAS/jUDEV1DhH7Eg4LGkyni+u6CmJH0PvPf8Nms
         IEmmAjtRJYZy4HhXNAp3g63XAvQZLz6yIsfEOPEoqd+fBPdK5l5DciK/hhSLZRwyHwQK
         D/Dg5D3ZqctEZ35efagadEcY21CuD2O8TNgoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768510479; x=1769115279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMDCAuEpBU2j7VyBDlD6eYOZpYO2bi5WCD88B/El57s=;
        b=DZ1zeZHp2qOEP4XBBZ1APDFVDr0mE7HnTF9Wt+1zWp55OiZ4dX0317bF6TzNXBi7Dc
         GplxeFHE/2XuzYHPH3MFD45KC0GcpYEzgcETELrfphJ6xJrp8ndPCGOvJVX1pcIsXEbg
         UShkradDwZpkw+SEVmtGYNcoHr8qZW3TLmnbc2DCvEsSaIUw02wRLlubYnyxqsPbNNRH
         DUyaKkx2GMydTlnBibvCnN7MB5b2CyNVYIotINd/9dpNbIZ8vAK3fXYzqkcNkSjRMus1
         Bklk7LVqon4rVA7xg5iWVvI84HTPtilxLMfjvwmYdcUJQmHEFM/uvVmWcY4WRaiZuLDe
         f/dw==
X-Forwarded-Encrypted: i=1; AJvYcCWBwFO29OEHd3WKaTCESS4Xio6xt8e6Pe95teajc65qbftskP68wnn+glsFyBfHaSPNwO56chzXjNpBSUvjx2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGYxeGkcumHR3nGzNQ6QbHA7xlTYvdbGxUoszqxOjzbprzD8zX
	myM+axC+8TlAzhzxEtRT1GQJgr8P77wbeNjMQyHhqVgaOPPtAxkODSd6TIhw99pLZ2r9Wbm0lu9
	dwnFwSBTYxM+oi9TaSkvRAfFHypvLQL9lIGQXq2Ur
X-Gm-Gg: AY/fxX4oEj7xWeJj8ktptNyM9RcXpRG2l/fO43AJv9Ge+v5PuoNvd0zWx4Y0VZyIksF
	EZ/NN8wRN+LvMrZ1GMKYCCACt6kpIMVOTPrnoQzMYwwxF6C2GREMHwlrjY5OgdSPuizo6iwcZBr
	ftHYWlE8jkfapuwwcAsfg0USwMRwby4IpW5KkQ+q1SNz1Ss0Aq7Cq0AZep8uDs1r0wnZ5tHc/G+
	fqp3Rs4N8JQ3mPsH/8sI2O5hMaWm7L2Mc1RiEHmonKz9KFfnSHOWtFki5CEuHJevrkdoeowTkNl
	Wce0XCd+tKpQpJN0BXimKuNgEA==
X-Received: by 2002:a05:622a:291:b0:501:4539:c81 with SMTP id
 d75a77b69052e-502a2308ca2mr2072271cf.2.1768510478470; Thu, 15 Jan 2026
 12:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115082128.12460-1-tzimmermann@suse.de> <20260115082128.12460-6-tzimmermann@suse.de>
In-Reply-To: <20260115082128.12460-6-tzimmermann@suse.de>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 15 Jan 2026 12:54:23 -0800
X-Gm-Features: AZwV_Qhkh7OWarAssFoak5kIszzJHYAOlxl7WYMlwiaFV3xMZUkLvFfEXU3N6YE
Message-ID: <CAODwPW_n=LfW+az4v8XecrzAksFmP+0U-9ELb_TrVtLL4EGk9w@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] firmware: google: framebuffer: Fix dependencies
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org, 
	javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Not really sure I understand this part? The code in coreboot_table.c
creates the device that represents the entry in the table. The code in
framebuffer-coreboot.c (which this Kconfig guards) contains the code
that creates the device which will be the actual framebuffer. Doesn't
it make sense for that part to depend on a framebuffer backend being
available?
