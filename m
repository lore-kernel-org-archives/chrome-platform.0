Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2527EC7C
	for <chrome-platform@lists.linux.dev>; Thu, 13 Aug 2026 00:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786582044; cv=none; b=Iq1FLXP+lHdouJQ3Gb/qmCxfEQVm1+1XQ1TeVQtRHWio5uHewyjBCfmiPxdVqYlKZN6KVfHyPjW0WGe+Ej/3YG7iBXiRdHD+u7nXo0U1z38XVZv8DS7ZtllkTYF3xMH4DOcFTi7HNhAoAkU6brDJkUpcHJVQb3ofpjROv/P9gEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786582044; c=relaxed/simple;
	bh=nr0JbzfBqGevMUFWP5WeE8p+Mj3rdk2zYt8M2x9Q7UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbTlpjUuer7RWtzEBLpT+86UoVz8W5Ut4yNesPeLyKzBNB8EuVD4vjlfArRfil69CRBCUTMxijo/pso+HJv/visVtcy1WeQI/k5pB7IHzHfx7FyZeko1yHq7ujjGAlJyJ1c+d53TtaR44wiGoHfc3NVNuonNgvag587/pYq7lFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fkwbzzan; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fkwbzzan"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf52d15d88so16043135ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 12 Aug 2026 17:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786582042; x=1787186842; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=FkwbzzanZw0qkJSKjT9N1fZ1XBzFT18wCU0GyTjwrHWFcmRpIA+CeigZSI3uCCTstY
         GD+oteLeRoqIshKrutfelKVP9T6s2Su6Q3dZyWfL9uR8i6hJtTbQ4pwru9sPbvJKdD6f
         3CTR9YdqUkj+pHmPQACQ/yRP2rRwNB2VcNB5YjBwb+bnFhFkXXl8JLEIKFP0ZiZEggQN
         Vnm+xyyBAC1UAeCbPSOoLBFkgMFIDGs02TmNjnUOly78vJoubjqLJ9Yn8KIts+tL8y5S
         ziokQ6b9XfW0UOLD9ZrP9UD2hS3a1AqBEfTVI8IZGxo8ZCNA7nYFms8sqXZOOY6gp3Z6
         LN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786582042; x=1787186842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BsxTIcePTgkc+qhqyMPuO3rIwVn2+yc4KgD+VvA3wo=;
        b=IARD9WwRpaqCwrquM4Hd8tbzrlw4snLV1Z/HL6HbXvS7QQJXgWYjYSECq4YTKmacNM
         8mJwCcQETIq9MvMA9KWp16jAoQovf4nYSNkdRZV090laX+AkXqkavozGt4MDNTI1/pkL
         Y1KBuy4OD0xlcY7vI1WRhQGKJd0BqvKyBsOxCNtTUhYN0WqFFiVV63w203AxRfn2cdp/
         RNWCdhfc7zgqBZwPHAZzRXSC6PsckbqEacpUxa5R8yK4Tfy/EcwV1VxXLtSNdiO4cDgq
         1TjvvOy5fw6WjfT1F3ymbOiXqIlGFYBcQv2kuTyA92UxbinuPbIJVx3gVrcH+oIc5TBX
         KxYg==
X-Forwarded-Encrypted: i=1; AHgh+RosZExAKuml3ktZ1KYq23QiN8nyczsxTzIwbEBVpKwl+OjD+O8uo6gyA+icvLanB6RTFAkiGpsNzmJGSa9riQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHyZUd7dzRwaPzT//CEtQmjJU4hEJFX7uMPP0C2bxHxyRGmM7/
	Ri9qjR7MXqdENxjwdnyV0DQLIjhnAX/R//Vf2OHHPt8EWFDDWo7ZTPu9
X-Gm-Gg: AR+sD11HRDJb9BSte8NHb7rA1tJwDdAQsaH0u+n41hqyjow+p36RedU4BDx5MeWD2OT
	llyEBOKUwkVL0oxAU3F3HsuaewzDnEoeGc2jCmD2NdqHTKT5x5FVVz0d4lVjZ/dhxFj7f0Ho3Jm
	xZ0IyYIllCGrSDcITa7MSn6KpV9hGcRVQ7XDUWJwQ7g43GCLMYFFWx61CIZhEjT04YVZ9OeaJqb
	0kNBugpgCZr6ylbpB3Fg8cAPRBROb1HpqP5+gTdrOKnm+6H4sp+3++iMMQyBOzmlaRHudaFLeER
	uSe6BYobd98UIAvRTKqbDELmglvvjs+BtWLtYetYJRuUjQ8v9ggumYdc3tK9VHplDGx+cJJlzgQ
	jul9N/UJmJ/L6jyrXyYBJ64auMCgiD3Z6mkjREaxM8DAmx/6Ibg+L2y6T6yGaez56i8fQvwnWcQ
	EvcLUlTPRLS3CbRSZXXb46NNEjjR/zGBYU1d5PFOdxbUcZPmq7G4/vtdOYvFuku6uFHIzK3syfc
	6ef7uN6QeuxbK3asBhn2wDbqPPw2g==
X-Received: by 2002:a17:90b:4b92:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-3931e079c22mr1944443a91.6.1786582042327;
        Wed, 12 Aug 2026 17:47:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:8656:b5a6:1038:61b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf732166sm1762331eec.18.2026.08.12.17.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 17:47:21 -0700 (PDT)
Date: Wed, 12 Aug 2026 17:47:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Message-ID: <an0UEY6gigYTWFLW@google.com>
References: <20260811122011.3539250-1-wenst@chromium.org>
 <20260811122011.3539250-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811122011.3539250-3-wenst@chromium.org>

On Tue, Aug 11, 2026 at 08:20:02PM +0800, Chen-Yu Tsai wrote:
> Sort the include statements before adding new ones in the next change.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thank you.

-- 
Dmitry
