Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887392D0275
	for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759272940; cv=none; b=p5zgZbLL2Ii135SnrNuCjBddI48UUQ+O8X+U09UsGE2aAqdLZ0AXqgZSpH7ynX+nxqJuFL6T2NxE++2daW8tv/aqwhczjmZYZ6//VEDk3fqyF/hJgOVMQQKyygtQoeTHcNZ2585NkLqwm6YuTYJmAT+KGLXp4BGr2OekymTzdPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759272940; c=relaxed/simple;
	bh=yVA9Jz0NaEGwNdHklt155W5PzrBW3E/ulBCRYzSYVKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MW/VAxzzj0AtgVDpT19X/Ik1FES3f3wWsscbTLBg4d9688wwfgCp8wktNyD99V3fM3Ds6QvCPKqfycuf8n0BuJDmLsm9NroZlJjJrMCv/6MgWfQh7+wLjFIkc4n6lOBkc/qFf8XYsQ8+nT2jj9f2ewknbuRu5y54KyuYB9PhtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2l20ypMO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2l20ypMO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5357436f8f.2
        for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 15:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759272937; x=1759877737; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yVA9Jz0NaEGwNdHklt155W5PzrBW3E/ulBCRYzSYVKM=;
        b=2l20ypMOHZ3V0gfUqMGeI3uiZnfRkqK+FOdpSiZ6Ee1arH2WEYH0EyEkOkMPFLP3QA
         L+CHi3cgZ2M5AzKXVKNZjNGq+QhQogvoz4tFhDNX/Ive+9xfQvzaTZIQS2gU5hXR0FiP
         27xFv9NdnmdGnlE19dv/ua4cdB5svHYk+ClBJbtYBaOuYIROL4/2aZDI7yYjgEbxGD71
         y5vywtioauEQn3XVSvdnJvgZvbkY+z6T+cUEls3O2BaRv6fu4W2rRU7qVt0An9PHC8Rl
         hwQb2STXcTFyahaSjxeEioDV17oO1PV8SXbR2/6g32RAjy1K4u7veJBoJn/MuKhw9E3v
         /dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759272937; x=1759877737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVA9Jz0NaEGwNdHklt155W5PzrBW3E/ulBCRYzSYVKM=;
        b=aG6J9YIx9pfUgWr5ONgL4f5JFVJF3mmSAFWXsXYfDRkkhYWNmdKQkUYOwxhlJVpVpE
         escQD3sjxRRGfNg1C5Ui/w/MLEP4+wxQgFSUYO5i38qhuVIyuGDBuJgQM4RKzgfMrHrb
         GU3vm+iV2djBCqFbJ1igfjsAC3RKOBbZGR+aOozUcvTNyo4SrYa5XaUucqkNSJR69q2J
         WYx2NIE7Tf9FpDeukrvGpvAwI9KT/IuxMapPE2aineLQyFfWWENoVmkz7P3hC1TiTlz9
         HorG5DOuf/Kpjy3q6balFfwIB7C91YhsffsrVUdB9RLUOdQHDl+Kg/1EG0Wtt3fHC+C0
         47HA==
X-Forwarded-Encrypted: i=1; AJvYcCVp7rWP9rRGVFlMdn0MGOTyNNChKHvzY4BGRaxwCAAeIEUI78DYFH65eDa8ZHbihelAzM8RZG69/vZpC4/msBQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyP9HTv7t+SqokI81tYQ3TWECIWRLd84X1WjXtlWeoXC6aoACS8
	jSuVI3mTyFigs0xGk9n87y2YW4i6yTZNQX9PJL+KKJqkLEskWGL0TqnkHSZi1AjqXddyD/aOLhI
	hdrxFhzY/Nbu4G+mYza7smY6bFmL3OC/gzpuYtkFW
X-Gm-Gg: ASbGnctDLQPYIZvgFSmxkj6gxdjzUMI3Oh4RUbVKv14/BBwNW/I/kA/Ovvqco35VY60
	4khgQ4RGiEkegMoRv6+rd4zMt38oNnQ8ptx3jSeFtXnPJl04nFH+TWxgJRUKMqD9mpswvplAhNs
	tvxUFJh+9ml5sqvdKQqwDoFt+O+Kkc/y4v65n6ErLZkPsSfmnUBNkR7hXbpl/QxaAUVfpPcMA9S
	Bqb1w2kztIDFuAGLkSDxpr5hRZ1zj7Lrd8jy3O/2RymyBBDza2VSLJv4jgKqTOs+5SgDLcuyHbN
	HUbTHOvH/fm3BQ==
X-Google-Smtp-Source: AGHT+IGHRuxtWgut0Vzt6PdinBJDWxg9G0yj04Jszjbv4ItQ3wbJzXeBdiQBzEdeuLcKh8ZuTRqv06sC4HCq3f+U5jQ=
X-Received: by 2002:a05:6000:420a:b0:3ee:114f:f89f with SMTP id
 ffacd0b85a97d-425577f1bf9mr975463f8f.15.1759272936532; Tue, 30 Sep 2025
 15:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com> <20250930012352.413066-2-jthies@google.com>
 <175920697975.1402374.5817792319376446761.robh@kernel.org>
In-Reply-To: <175920697975.1402374.5817792319376446761.robh@kernel.org>
From: Jameson Thies <jthies@google.com>
Date: Tue, 30 Sep 2025 15:55:24 -0700
X-Gm-Features: AS18NWBGGK3TvBvWwAKJGudm0q5uvJFaU-KF4NSgxPec6eL4jZqolX0Co6k50AA
Message-ID: <CAMFSAReZA3=VH+c2H3xA-ojhBnEEp8wxySFwUuKLq+6k47AA4g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	linux-usb@vger.kernel.org, akuchynski@chromium.org, tzungbi@kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, abhishekpandit@chromium.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> My bot found errors running 'make dt_binding_check' on your patch:

Thanks for catching this. I did run "make dt_binding_check
DT_SCHEMA_FILES=google,cros-ec-ucsi.yaml" to check the newly added
yaml file. But I didn't check google,cros-ec.yaml or any of the DTS
files with "make dtbs_check" so I missed this regression. I'll follow
up with a v2 series and test all bindings with "make dt_binding_check"
and "make dtbs_check".
