Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538021A38F0
	for <chrome-platform@lists.linux.dev>; Thu, 27 Jun 2024 23:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532711; cv=none; b=MVezhKS2W/CLSZ6gYpyvC81vqEDBf21eDFLOHvERKizFK9jS3MbXa7qBR2SruTqOCE0NlSPgm7wGEyQdbi4YBJwKt9lvk4zTHoQrZzv2e5FFhVkYtNvElGrR2Zi9qBGFxnNT4cAJqVsTs4otCzagPUHDF7lZc38Fj+LqC5H/n+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532711; c=relaxed/simple;
	bh=VvEmbALPGz/CqKOGYJCQ7qM1A373D4L/J/qlsil0cmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAvj+sfCI5N8cXWuPlsAOV6a/RGarbuNP5cOzxQS8rGVWj4oKzzFag7Dc+uGf0QFtJ57IsOgUmZyj+ylXWfUimv7qc4yxMLDi6R7hfNSBh1uo2sObLpXYW4hiH+R9RrYg3pFvFg31aY5dTe3VNFa/G0Q5gXDoBiApt7uY4+ey6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8G25Isq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8G25Isq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7067a2e9607so59410b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 27 Jun 2024 16:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719532710; x=1720137510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SlgJ747gekZZdrBLHi0FNPvw+j4+eabf4RtOttHEcPQ=;
        b=a8G25IsqpUYaJiwvYBIoaJz7eZDEWwoyGP/cXHWVZ3VOhgKgX84RQtAfhlJICa1Zi5
         qImSKQ4H8T1IPGqXtkDTSlY/uOPSceYda+R6AT36/TQUK3kXlFtCwiyAttvlxRs5Fq10
         VKZikM82kgpZLvmxwe43AGMThR+l3gT0xm977uv+JrQYkCGJV0iAn6eOpSMPSIJv9KVU
         MnrfOdGkevoBD+BjwVN41Fd6bjHHqmeeCTOic08yFjHGx+1EYj4lJDpKUBpsIpcCQjVl
         EFSc+ZL0w5T4NibjPFRhGu5y+k10tP4UOMwLf3L8+8soJjffelIeduZFt6JkBqrV3L0y
         Vvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532710; x=1720137510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlgJ747gekZZdrBLHi0FNPvw+j4+eabf4RtOttHEcPQ=;
        b=sqaDLsxy52MgIzvm3crUq07vJcX0KPPWdn1RV6q398yeiJr68ehuGN092iVabOpnip
         36yAHbnJa53SkjVJEh9C41YxQgZ9opUa9ed2c3iUgQo78mQLXOOq/gbPrKO9k6PGLbdc
         SfpsXdGkGpCqn2ywVU0u0hWeMTYjWNZUEtL7Nnhr72Y0fOBQwF6EZBJkt1S6lwBkvB+8
         ZuUDwrpuc1cngYrSJ7rgosxZyHWfVsiOGk+l1F/I7QnWuGwtGkxkcZAyypuv8oOnURES
         O4kcPqNECqFweN//RCgbRXBBvbqL5mthzSJ2sdAK/Recnn1/0oWJpAFmjCPX7xH+Tjhu
         /NnA==
X-Forwarded-Encrypted: i=1; AJvYcCVZf/GZDUw0XvLMttFkNRGj9C8Ffkw3uSYXlMA4XvwoLtTm/MtSfpkJPlfB5bwntrwIhoZFmSf2ZI7WE6OpGbsKlURddS+44xHMrfex/xbN
X-Gm-Message-State: AOJu0YwSV/LKo1B2N7mFktK5NFL1b/DL/ljMJLIInzxbrVmoZRyo3JoP
	QDHgbKEj+WlqhfBhTDYc/JNnmp21j6N6lQd/SJl+hFPTsNkNDp27d1IizQ==
X-Google-Smtp-Source: AGHT+IGK9yAdSPH8/kcb7YeTj/d2kPcFUZTaSP6n+f/K5RJLPg2HXD8SzlEsAacZXWRJiB4wrV6/Zg==
X-Received: by 2002:aa7:9dc4:0:b0:704:2a93:a6c2 with SMTP id d2e1a72fcca58-70670eead80mr13868250b3a.17.1719532709454;
        Thu, 27 Jun 2024 16:58:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c929:2998:720d:a104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044ae395sm299712b3a.144.2024.06.27.16.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 16:58:29 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:58:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] cros_ec_proto: Consolidate
 ec_response_get_next_event
Message-ID: <Zn38onz6Dm4Pt4DH@google.com>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>

On Thu, Jun 27, 2024 at 04:53:07PM -0700, Daisuke Nojiri wrote:
> Consolidate struct ec_response_get_next_event_v*.
> 
> Let X->Y indicate kernel X sending EC_CMD_GET_NEXT_EVENT to FW Y.
> 
> Old->New:
>    Existing kernels send a smaller container (e.g.
>    ec_response_get_next_data) which may or may not fit the last few
>    bytes. The FW copies as many bytes as possible to the container. The
>    kernel processes as many leading bytes as it can understand.
> 
> New->Old:
>    New kernels send a bigger container. Existing FW copies as many bytes
>    as it wants, leaving the last few bytes empty. The kernel knows it
>    didn't receive full size data from the returned data length.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
