Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C12342CAF7
	for <chrome-platform@lists.linux.dev>; Mon,  6 Jul 2026 12:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341437; cv=pass; b=mT9r954uYfyVQ7ofpFEfmNakSFXnpWOfErBsD+iiKSdLLRXjwBuees7msi/ZUG0uuoR1AdKGwmDbRcmttMfz2NabpYkGmWVy15yn811CiLFiWUUcfwzPnEPCV1ZekkpmOFHcTYs2AkuQ4iPwZ3Kp131KD7aEp+Sua/e185Q0S08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341437; c=relaxed/simple;
	bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kshdvavck5p2VvUnm+byUzlsdjf98a4RuPURZM4uCUbnkjhy/XopRhbYim1U5ibL5jcaKLXVMZePlCu8S/FYNHTb1eQf9hz9cyu6xkIIJQwAbRenLj+n/Ukwyb83SieQ5UrAQEe7W81wL2cPmS5DKM3YYbDageJlCc6OKBNuvgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhmV1mZ7; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhmV1mZ7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cace7da66eso27506975ad.0
        for <chrome-platform@lists.linux.dev>; Mon, 06 Jul 2026 05:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783341434; cv=none;
        d=google.com; s=arc-20260327;
        b=Dk0ScVsxCZCaY5BCBrkmOPd6Sd8TA3PWLh9GyS8KAbH75Hoypl35J3eQg6ZnWb0WWf
         lmd2qHyCU6QphhVeTdE1etAkS0P3jVjvQEmQfmUFda/24C2df09XCKScG332l6xcQRcL
         4G1fov1ngO4pyrgRzlXh+IPloPnzowt1v+1CCfg1wI0eyCD20vWzXwghCh+v6urREoBg
         8dnHcp/C2vLmx3FgQ4JlbOZ7/u1sMilH5SOw18S+RGTPo1ZCZJpTVK7zqGM4PjJ1HFXT
         BamnsZb82gBIO9urtpkDLrv9gW27ttAn3i59oKjiAhVL1lQpYXPwRKNukJq2YN3PX4Dk
         jtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        fh=6hzqPu9A7P40dioHMCCDy1lXyCFvF1PbhPXoK4f5Jkk=;
        b=BNbO0Sh0ChRhhDQQONlTv0/jjH+kGJu/eq68YwL5901rcisnyPXTdlOIHcHdzGpCHD
         L0vSCmewVmwvDfcPlA7HKyrl7Rb6fJQt38MgyjGco0doxvysO/BQ0TbgoVTprvU13cUo
         ec9Dfi+KmpouAXzCSEMPujCCkelltf5YA7lqavrD3LS8VmYnJai5+HpfrRfk0g985epS
         bk7D0NFXJqkLuhKjKlo9A1+9Hxv7FuAowNCE82gWEI/glGYYRpC2pxOIR5aJV0JnCjSS
         NRs7XGz6pYyeQHjymlHoQJoxZ6OR9BBuILJ5h2uHWkt9XrgJ44+a0CchRTARyiZeNK6H
         AGpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783341434; x=1783946234; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        b=IhmV1mZ7PMW1PTDoO/oot8esRYTYn2G2Ze2Ifb9O3DGpm1eA/nD0uafM1Aex1j3BxP
         kaB5pF8/oY6DvndqCKwEaGrI+Em2OYQOlVT4j9dIrEYXVuKsb1doDDR248VD/4KCCxgy
         2Ooo+g1H0ECrSkup8CwSO2HcAHWj/kKTGdzpv5xZ9w79UD2/XkWFXRXBkisOiBN0LUtF
         /l94b80gsUxrkTPAnoR9+b3WDCEupxyeLe6hVi2RCfYl0HZy6vjXl4RVi+tmuVJ1htfD
         GA9R4AwFfimoAB7bmWPWiMTLsQ1pmHHU7zN3Z12NN6DbMxFiQTx236cFSZq0IlPTWLGh
         8Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341434; x=1783946234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fy1sg1FRdxZLE+BdNcUjVv9HercnjIEfJiH/fJ/eQx8=;
        b=hRanFH6vCQXBKq27Cdkt9IK0a0TmcHw7t5/tmXgrPEAkb1XRkVkCAdW0FevPBHL0YX
         Kvv3XSQ1NFWfnJcQSkLXmTJyrUsEfHX3hFmF5I+ftcku/HHsEtut4IvZ29Ok9982LyU9
         UUrIbKMqZpWfWX9HCujNJgbXwevICqnWrHDWwrpepMkuvzfZ6GTDFUZk4m6ciPeGJ43S
         lM3fhWb+/PmvrdzC+pY0t3f7xgoHtqpmZcirv02W6P+sfV3g+jvwTX0eqYS85AGrjEfc
         ZXFagtDiGm5JmJk2meXQqZeu88zTdURgSWtpFCyvMAXYJ1GXxK2s+z/FQ+416U8bsaob
         b/ag==
X-Forwarded-Encrypted: i=1; AHgh+RrVbn0ivoUCN7G+2LSzi+Dz+BZPN1rp/psvLQ2BhGgczQpLlK1Du2ITQXOvZwLXl1cz+DOiyNoU4W4l73tDbY0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxrnC4dmMBzhJf1np0QVkn/y8Ru0VxmnimwwYIQXuCRI9Jvy+4c
	IuNa/jIXqb1uTtIL90EZefh32rpQzecAxaWXNJ9FfPfwywrRufmU+4piL8ViZnRdZUmsda6uPH7
	XulgbTmoJERy6Lkm47/bfo98Kr7jrgYE=
X-Gm-Gg: AfdE7cnxFGS8R5fixRIMTcGHEBs1UMOx847rhh6b0TZuOESjPkz0egKdOVgWXDPZ9vX
	IfH2nFsrQTFIzRI2EQ/+PUln7ytPIuDtxBBNH5TSwqphlME1gjooLgJB5bpd9E8xt+M/LXfAqtW
	VfW+eZPHyxyz63hA0mBVOFtAkWF0hJDueRCU9xzCoAK0+5iVqVUFoenBnHGwd/SfU9T2TK8MBJ1
	L6Mr2SFiVL9awpjmNB0iEZlTJOU3pgglWBLCkg416vc0x/WaQ1QZNClpEGWXM+8OcXKq71vign+
	21DABwyRrxu5i0fC3WRUtfWZRNlbgUrua+78tIAWQr95kRzoZLo4cRR1Xugq
X-Received: by 2002:a17:903:947:b0:2c9:b8e5:5741 with SMTP id
 d9443c01a7336-2ccbf07b545mr2322555ad.35.1783341434357; Mon, 06 Jul 2026
 05:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com> <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
 <CAABR9nGSRH3DmehUxQVmfJ4Po8TOhfHXDnjjkzVJDZZ1w0_51w@mail.gmail.com> <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
In-Reply-To: <91335528-fe36-44c7-8e72-37bb0d4f2620@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 6 Jul 2026 19:37:03 +0700
X-Gm-Features: AVVi8CekunH_Av_DBeV6qAHzPUl7QVZFKXN1EOeDHNYBqX9OGye6fLchJawVKpY
Message-ID: <CAABR9nE8WN=HnYo0JYhQ-uOtW5SZ8fN-x3xG90dzMzYDrue8zw@mail.gmail.com>
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, povik+lin@cutebit.org, 
	u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
	christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <error27@gmail.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
	Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

>
> I mean the code is correct but it looks wrong. Because it tests for
> an error in rv but then returns a value in ret.
>
> This can be cleaned up now. ret isn't needed because it can return
> IRQ_NONE in all these places.
>

Got it, thanks for clarifying.

Best regards,
Phuc
