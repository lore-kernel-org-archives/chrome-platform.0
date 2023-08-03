Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42807F
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 01:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3035C433C7;
	Thu,  3 Aug 2023 01:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691025626;
	bh=4hwuGhJEvnwLDtB/X+j0halHFuoke4wqDTM3YoIj+f8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggifwBj0Jp0uhjo7xuMs+0/nAiu17AUX/gli0tyYgs2cSltWfa6Ld6kcKX98JJ3gk
	 UiGBe2NpEbQAAbwG0Rf57JKncmdz2ygZb2v/Z930uj4wP1Mn3kscyGqlag7vm3IxVf
	 WkqSJiyc9edHvEqAcNF0I3Pd5KhA1yANeo9GQf5/PHal5gEPng/b0Hznr5POprzBEb
	 cQYl83IWUj3TtpKQg4HtXuAqXyiJRFy/BgM5LvnWBtgKt7kX3LqzyeaEMh7CUNrt0j
	 D9Hr+shRD8OxbQ3mcaWzcYt7vpdLZ81Fiit40sPdSSPMGISIhIAHHfQmNbFiiiK8A+
	 I3aEqn1rAdB4g==
Date: Thu, 3 Aug 2023 09:20:22 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	usama.anjum@collabora.com, briannorris@chromium.org
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZMsA1kx8oYXzvYnC@google.com>
References: <20230802095736.3079963-1-tzungbi@kernel.org>
 <CABXOdTdV-UnTCWnq_fD6bvJ3c0gX1jvx5ZbkV3qOHjtk5+HWOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXOdTdV-UnTCWnq_fD6bvJ3c0gX1jvx5ZbkV3qOHjtk5+HWOA@mail.gmail.com>

On Wed, Aug 02, 2023 at 09:04:10AM -0700, Guenter Roeck wrote:
> On Wed, Aug 2, 2023 at 2:58 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > +truncating:
> > +                       dev_info(dev, "truncating sysfs content for %s\n", name);
> 
> I really dislike that because it will, if it happens, clog the log
> (the condition will be permanent). How about using dev_info_once() ?

Fix in v3(https://patchwork.kernel.org/project/chrome-platform/patch/20230803011245.3773756-1-tzungbi@kernel.org/).
