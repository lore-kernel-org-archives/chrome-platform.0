Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDCE2E0930
	for <chrome-platform@lists.linux.dev>; Sat, 13 Dec 2025 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765618850; cv=none; b=tlmF8PfZspndkDuqVRRzwF6RGEaQfwSKXz8+6RjRFr88AIKcKZUxpdQ8DE4cUlPRh4LqYvFi+VatKSplYcpVuiLfnXJoz3PEsZfhMui5kpG2aMHXd1sFzMWTPuqtW1tMJt1qhHhZsbFmlLStm87564VO+/4y3DwjEbc9ZbugKNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765618850; c=relaxed/simple;
	bh=qEFKXie5vJrx6a5S+nNUgx0Sj0uAo/+iyw1Pq2VAZqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+azSjXMI6rkQFn+xzwmqc9ri2Vvzsb24lr++53sSZxgAmqBRSBneq6gVOvZHtjRjTVY4O2FTDcWSjMSufGTjSVhqAQG2uqmQ9XaG+EB8tI5WECiBuetqkMppHuUhHMB5rnZKUsxJmdLsFyg+i0iamMPyeuaUJ5M8fXAKpcsgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1MEE61X; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1MEE61X"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34a2acb736eso1591781a91.1
        for <chrome-platform@lists.linux.dev>; Sat, 13 Dec 2025 01:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765618848; x=1766223648; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GlXqF9nhSvIgkdEsUbMZ/tQ2h8iuKeKknEMLOxVfXsw=;
        b=C1MEE61X+0hJLGFh8Zj+yrOY8Qq7ePIiOWsy5GrKbWazrnyVWGv1dzGztz54plQRKQ
         vNtk6rGkZl3ONAURR5+cowKKrTmcco+t98z2cIM8wcnWmR5HMx7hojSeGKLtZUwxj4XP
         PwGCf5Nta4TooOZL8JNV81sMNZby7/sFncqL2t1tMYpaQHmmuBaoBaJ0pbHCtzwanDh3
         XF4VAe8z037VXtpBUo6TYybKIBE6MOwIIa3pabSQ/CJxvxoCLbb6hkrG+b+HeYqM0UYk
         lnLc4XC+cqsoH/2X3FbO/BoZPmkxqH3ANxzLpsQuQZOPBPiRKhYhLLscbdZHY+ruoYqG
         Qj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765618848; x=1766223648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlXqF9nhSvIgkdEsUbMZ/tQ2h8iuKeKknEMLOxVfXsw=;
        b=G33YmNRey2P6z++Ut/WUZLnsMJlLZlKphtEGKPocFQdfbEzQ+1S1aPjHAo6KIt2aUd
         ckue5nhbkFl9FQLTHJq+0vE25dGQjvr/6SguSH7tG+gRRRv6w1b7OXKN1yxnzSTIjLlV
         o/TL+Dg2Ie2YwTi6qbIqSwfaFpM/NDXSSM3A8Aqgh7DpH+AUfp9i/rQL/4KdCuDwl/Wd
         yP5uklMkTFtdXf67wuT6VPSa2HedcqK0MBwgTbO9C/o6VPaWkrLhiip/RgC2OjTG8/Gv
         Piymr4WQ31kt/NOeWR0xVykRB/zQ3ip6J1aBguiQrS1wI5ZxrI9BzPl+lB3y/wtMdIz6
         kg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDxvWV5BI+Dslso17kDGXHyc8LtenuBl79Nq1C0FeobBQ8wMEIv5LIP1XErfVTbGKY7KRrrZcWP7uRp+OX0xY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcki4VwMNyFzGwGiGmefy78q3d0De9nsbazDyDXOT04EftTcJV
	5Bn6UWi7E7t8T7d1JHxb6J0vTBWfpugyrO3r/x6NwpWKJXDSW4GzX9R0
X-Gm-Gg: AY/fxX4dzOMwghKECHICvoEpsqzGYUaMpJVh4OSDEBSCf+ut+dLESXWpFXJEbdACcWC
	/QfWmB/Xc9RPhh4YPTpdeJmK8boWVUGope44i+S05cF2xcHobEG7prAwXEpdwps/7XSpw4inYBn
	aNW6armQYPypwDizQECvAMiVZpCt2KEP0QtjMWO5pyivaHXrM6Gid9H9GbahziPdGeyDoVerAxd
	WZMt2swHEvhTDkXWAC/oz9uH4g6TqU+jZ8yd0t7vOrN+w54kGZ1meQzRw6cJDlkYPSljrEFF1PA
	dUOlLS50G/D1SpTL2kd8fpMWJdccWVruqFZ45OuPJNFph9kUDXkj8DgwWjC6dD0vpdhM1qFSBZH
	cMUAaNPQXSeBNjP1BxY1HhR2wtHO0aeFSeiGfR0RPr19JOISML69bqjLkAOkyG1k+lwrbsR/jyN
	KU0iLyndt+94KAS2H98Oyqwu0MIPnYrk1xCs5IqZktMWwTih/xYFHE
X-Google-Smtp-Source: AGHT+IE3dHo7tKyXquVMXM8M5LvDb/NQv3IV2NNUcYlrcgrWD7s59hZ5Y0Qv8n3Nsfl4CN4sKLfwbw==
X-Received: by 2002:a05:7022:5f06:b0:11b:9386:a387 with SMTP id a92af1059eb24-11f34c593e7mr3132632c88.42.1765618847882;
        Sat, 13 Dec 2025 01:40:47 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm23455386c88.8.2025.12.13.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 01:40:47 -0800 (PST)
Date: Sat, 13 Dec 2025 01:40:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Baltieri <fabiobaltieri@chromium.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Simon Glass <sjg@chromium.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.orga
Subject: Re: [PATCH v1 1/3] Input: cros_ec_keyb: clarify key event error
 message
Message-ID: <53iuqpw5qvdan2s5hegbeqdw6oyk6eygdied5j7gqbatmmdd3u@gpmn23s65rci>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
 <20251209154706.529784-2-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209154706.529784-2-fabiobaltieri@chromium.org>

On Tue, Dec 09, 2025 at 03:47:04PM +0000, Fabio Baltieri wrote:
> Reword one of the key event error messages to clarify its meaning: it's
> not necessarily an incomplete message, more of a mismatch length.
> Clarify that and log the expected and received length too.
> 
> Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>

Applied, thank you.

-- 
Dmitry
