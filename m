Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946801C28A
	for <chrome-platform@lists.linux.dev>; Fri, 10 Nov 2023 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrlN2PhO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc28719cb0so1333905ad.0
        for <chrome-platform@lists.linux.dev>; Fri, 10 Nov 2023 06:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699627954; x=1700232754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RCYW7xe4/6WtMRC077jmdho114qUuHMiZgjwwKBclXc=;
        b=NrlN2PhOWHW8Y+1u37Bmlcr0Z6uSxH6iVX0S+0zzVHxk70vTU9anyM+oTq/XOcwUYX
         nonJe5R9b8288O2mlLgyZQOitfgpnx2Es9J/1hznPMbyjXA/1h6kj+gxzMuFaAl4OBeZ
         jdsjUwUhs+ZW2LdzmKvBAUCD5VgV8DLO/dAU+RyNuhJ4GpNbh/vN7KjX44/1YnIzIloU
         i1DFEcmP34STnGqsjlExuOpDCQmTTVgxcw8Hh5bvYVZm9WCP97xQUpKO+8h2ShlLQZVc
         shkJ6fbu4MqCyiYtFxN4+o7F/s4IYlOkWFPHQpArbk3ED6P5Zs5Kjq0uqrlaMhLmRa2E
         rd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699627954; x=1700232754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCYW7xe4/6WtMRC077jmdho114qUuHMiZgjwwKBclXc=;
        b=l6l6HboAV0PAtUdkE4WKDE1RAKNJ+gilyw9z7qQClV39o3ub8jv3lRzZsbSNwCmtTf
         tSSdF6zJqLBSpF9RZ0K1QUlzvNTRfbzn3b3iIDKlVjhBSK7EV7Oy9IxJGUqEdc6KerWc
         Yd28lvB++do0yz92KVxdEpctNJ+rHTuP4FfFzRDsMzXkD3SXP2djysSthJ6iiP28zqYg
         OmrZpDhO3fZfePOvb2GKAt1F0nsJTMN5SKshgC4ze7esWBuakx9dgL+kIC3KTiJnSga4
         cSWYjNE3QiNK6scL2ohS5HfxbWtk310MSBJhlpPKyYyYLpfqtPzYXWv2ie2hzIzhzgIW
         u8dA==
X-Gm-Message-State: AOJu0Yx2Yr6fVKmOEqEVEIHTTuakVy86hyfdI2rL12EmyqS/cxj2JOYN
	eR+JsTIURhgdBulOt2EA5UI=
X-Google-Smtp-Source: AGHT+IHeslzBkBgaKXUFscEMuU7zc4TueGrQxq0vGUGBzwH+9fs6mWgegO6Phe2dlCQHiHyxNO18cg==
X-Received: by 2002:a17:90b:2b86:b0:280:2bcc:65be with SMTP id rs6-20020a17090b2b8600b002802bcc65bemr7838853pjb.2.1699627953730;
        Fri, 10 Nov 2023 06:52:33 -0800 (PST)
Received: from visitorckw-System-Product-Name (IP-216-168.cs.nctu.edu.tw. [140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d20-20020a17090ac25400b002777001ee76sm1710908pjx.18.2023.11.10.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 06:52:32 -0800 (PST)
Date: Fri, 10 Nov 2023 22:52:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] platform/chrome: Implement quickselect for median
 calculation
Message-ID: <ZU5DrcuiVolHpY4Q@visitorckw-System-Product-Name>
References: <20231109185439.1535962-1-visitorckw@gmail.com>
 <ZU3GbHTA3x19h2Zi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZU3GbHTA3x19h2Zi@google.com>

I apologize for all the foolish mistakes I've made.
I'll separate this patch series into two patches and submit v2 later.
