Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AD7C
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jun 2022 00:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DC2C34119;
	Tue,  7 Jun 2022 00:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654563336;
	bh=NRUQsLYrMXbJ6K3FojmmsbXnxoKX1prtQJUYfKxhNn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUHsfyWZoPGYX7H0pjNAAxuTQ15yAph7bjwH6LWHAGSfkxt4pLBmyER7sacp4Vzsm
	 mpoJKT+MZIcRPlpoQpDdFRJ0jxY33LUqu8+QXI6PFTDBQcbczFx/32JaE8qbB7XoxN
	 5e9m54B1CEp7rCyrBbm3dc/AUpOyc5luxbosFOy2ZZy7t83LmmUm/pcRu0i2K35iyY
	 /eTegYRJ7jRg8jY4vS387Lzp8LaiQJ8KZ1h2EQ598YkqkVc+8fHMl0pXKoIb5X+ACo
	 RY37XjgRaZDJqZhLpdzZ+poFwTxpNKOuLRaL/pLcuGTsA0OHh+hXMntz1jDVdY+9Ox
	 bMKI3Hp4KvJEQ==
Date: Tue, 7 Jun 2022 00:55:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <groeck@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/13] platform/chrome: cros_ec_proto: arrange
 get_host_command_version_mask()
Message-ID: <Yp6iBStcJCOwqjiT@google.com>
References: <20220606141051.285823-1-tzungbi@kernel.org>
 <20220606141051.285823-11-tzungbi@kernel.org>
 <CABXOdTdPwvcS2eSrXsT8dNd1XnGNugD6ub-x2qscT8YRwwK0SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTdPwvcS2eSrXsT8dNd1XnGNugD6ub-x2qscT8YRwwK0SQ@mail.gmail.com>

On Mon, Jun 06, 2022 at 09:09:25AM -0700, Guenter Roeck wrote:
> On Mon, Jun 6, 2022 at 7:12 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > - cros_ec_get_host_command_version_mask() is a private (static) function.
> >   Rename it to get_host_command_version_mask().
> 
> Personally I prefer to still have prefixes, even for static functions.
> If the idea is to have a shorter function name, maybe shorten the rest
> of the function name a bit.

Ack, will fix in next version.
