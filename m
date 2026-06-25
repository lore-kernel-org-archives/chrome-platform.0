Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1829A27AC45
	for <chrome-platform@lists.linux.dev>; Thu, 25 Jun 2026 05:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782364646; cv=pass; b=LvTQuxvu5Y9p/M+ScHg57evFzVIW1lzPjraymxdDMiLZpitAv5L3X/mIX+XS7weBv3CDMCI4Qsqf3uSP8oq47Nrk8YH3LT/P1D3U6I3JqJPbvF/4QFHzCRSLLm9G0bgOJd+GJEKKJTyQvVuXmuwJd7mRgfY6aStptO/d3P+7fNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782364646; c=relaxed/simple;
	bh=HHw+sdpvABEoEOwqeP7iGnOnbePC3NyJ/C5IJwToKhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REgz1VtJw2ro2gx5XHUX06JqgAKPuvRdW+Gb9AvS2Dih1lS1lWpgvltin/rjcI3235LC2ylPZyK926pA8XNzrSBOvtYGAjBcKvQk8AfjZRP4YVyptLs0hnl7ijpb1sEezkLeDjP58Tgik14DJ7LzjCzxJtJWjLG7dEI5H1r9Mzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGtiJ7h+; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGtiJ7h+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46a0741a09bso613677f8f.0
        for <chrome-platform@lists.linux.dev>; Wed, 24 Jun 2026 22:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782364643; cv=none;
        d=google.com; s=arc-20260327;
        b=WMHNst7V75JdXQnFG2YpomqOLtdD8jTtDs3yhJijD4GzOs3Beva7n4+EM/6G9ORZqo
         G68jG5jwZ8IUY7bUfdVvqEPPsKFFXGNJH37rZJijhVbNr4gn/Mln14DWux5OK6GL2N2d
         gfUvMv/PgFigEKC/ox3opophx33uazwqPuRjHemkIRPS3RVF9mrHB7M0GVuVylmaiSS4
         3iK4roi5BjpXb85gAJutLcY8On0k5KVAL1yyF4jwFq3SBU+qKlc0XXirPC547pl6oS7R
         QJHE20s7Ws9XlKXjfk+JPGxRL5tpsR+hEzTuKTu49SCoLioA1a/ytBfsny4aNkDOA2hv
         5/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HHw+sdpvABEoEOwqeP7iGnOnbePC3NyJ/C5IJwToKhk=;
        fh=w6I7KU6ElfcuHJ+dnxKZUG5dA7iUjOBRWIgYU/V3HQk=;
        b=ngo20K3CP11B8qaYPa2CyhPkkutgCVlYdPAqRV9xopGHeECcvJx0/aWS3G5pBLUAk9
         K351uuPRGJH6cVDwo0l/QGhiY/w9NtDkttn6t7rCeiQjiVZr84PqQefGa7UCHhtpfPrv
         MVdLgDUwfX+wVlIpqTxIY64HtAXOLmc7ewke67+HaZknoCDhyyRltxkHwD5RvI88+kjT
         1ns65jgRHfmAxxgS7fbT3BVcy6ei7uerBBgSrcvTei8POuieXf6CFP62JyqVh1y5o+J0
         sl/ZKyjfwmQafQtV9zGaa6xoBoVTxuXuvp04DKLyhktbGr6NLn12mJsIKZCbE67eSwxv
         5O9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782364643; x=1782969443; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HHw+sdpvABEoEOwqeP7iGnOnbePC3NyJ/C5IJwToKhk=;
        b=YGtiJ7h+/N7Wa1L7qKT33q0w+uK8tk+gYhRoPmcfk1lZrnQEqeYzzR/eHxRG+fgaFe
         /H1b/cf5z8zJvF4+anrTassIKaMIBR5halTuJkyc1uAFgKSBTKT1nvKWw+BhaGCgraos
         9fov93Z7snNJamB0HnCJY0kQnhwrv2uoFBfyLuUI0tGfxKdLLrFu4nz//9qOIPv0voRk
         SAi/cJWiZJf4HmK8Q4yERaN0+R2/CDuqPiPPuUFNJgl/mnA0FSzWwTpTae+VKfSmzwhk
         DOvaMJlYsvtOLvRt5xKaJ8L09hJkLfqkM2cL5u7BY1j6Ftr/ahe036RSQ4yyaIvJjCko
         3JWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782364643; x=1782969443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHw+sdpvABEoEOwqeP7iGnOnbePC3NyJ/C5IJwToKhk=;
        b=hYfp2qnoenetA0kEZUUCHi6+i77SBaqeR8IMxSC012CBlmIOKS3xSUgLvaQWGtDXwb
         hK111LCYN6P3Ae8kM0AlocM+0cfpc5YJINeqFL3ZqaIHhpnDMvmvTNEfkwoGjvZ/yahv
         c4OI0Ougxx8YfFk7+e/UtqdGoRv2eDGkKVG5mqYL8lfdiPAj3Bf0hRgEFtHZr9PGidr9
         43NT/7kZOUZdpQZaQuZ99D/kdP+L7Qf2X/BkX8fo9Iwl6qzu6hwmxW+yF1YkTD7bdd2G
         /hs2foojG7zpHpuyVgiQ1M0KsqkR4SCNlLVwEAX6ncJhpNY6+Db4nZnGcuJ8pMPS+fvm
         /5yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/TkJPQvn9G9MzVv2SCvLcfKGOpjQDI+MN+cr5nX8RPmCGlj2XZV0XaaW06kNJuQeUpafi/prDjyVkW7hcVRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzE3E1A147l+IPe1Sk1Rmd3qKNyEsUE/zN53xYhGxuxy3FbGnjJ
	7ZzlduUL1VtQtry48h6Rgf0gVUflbeLBZSEjdWXXtKA5cRNgpCkLwO1V1ZZrN+c3ibMLpjoQH60
	O3NmjTNW6njcrvuQnSsIpBzlkk+sPT9w=
X-Gm-Gg: AfdE7clOLaJIWVE19H7owbeRun4cJJ0p88SY2Z+zWyXgWchopmGMYXYWZ+2Sx/L7ofQ
	LJ5Ue1HAKEJV3u6vpYqLAdcOqgL4JRIPBokkiy8sc1E56QBzFNGTRDie2LcZ7Vth6t+qndt7Iky
	gNKkB39BWErkZgAARnEdSSWuAt9YR0R/GuhyS+KwKi5SKINwDNFbCjhWR1CNI7/2nkINoj8PV4k
	rTfzmmpI/CX9gxtl3AZkKwOm3BcSdfNg17WR0ouIB9q+8/jWZK2RvQhanNo+CnKUYEPZPRY3aOf
	w/56OQ==
X-Received: by 2002:a05:6000:29db:b0:46d:d5da:f0ac with SMTP id
 ffacd0b85a97d-46dd5daf220mr501700f8f.47.1782364643329; Wed, 24 Jun 2026
 22:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <178229037114.3009621.14045345257767446805@maoyixie.com> <ajwgjQQsuj1AYJXz@google.com>
In-Reply-To: <ajwgjQQsuj1AYJXz@google.com>
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Thu, 25 Jun 2026 13:17:12 +0800
X-Gm-Features: AVVi8CfeliAcMGaeNtgRn7tiSxamumf_A5jimjvKKVWUosVSpLvg5KkmqfTw84k
Message-ID: <CAHPEe=EwiUwKP06fp+wMYPLcivzYoUvb=id26V79D_F5-6uWog@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: reject out-of-bounds PD
 cap count
To: Benson Leung <bleung@google.com>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Kaixuan Li <kaixuan.li@ntu.edu.sg>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrei,

> Are we only rejecting `out-of-bounds PD cap count` here?

Yes, just the PD cap count for now. That is the only one that feeds a
write, the memcpy into the stack array caps_desc.pdo[PDO_MAX_OBJECTS].

The same path trusts a few read counts too.
cros_typec_register_altmodes() reads svids[] and mode_vdo[6] using
svid_count and mode_count. cros_typec_handle_vdm_response() passes
resp.vdm_data_objects to typec_altmode_vdm() with no check against the
fixed resp.vdm_response[]. cros_typec_parse_pd_identity() is already capped
at VDO_MAX_OBJECTS.

I scoped this to the write so it stays small and backportable. If you
prefer, I can send patches for the other three.

Thanks,
Maoyi
