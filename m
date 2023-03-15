Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FA7E
	for <chrome-platform@lists.linux.dev>; Wed, 15 Mar 2023 02:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90616C433D2;
	Wed, 15 Mar 2023 02:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678846924;
	bh=TJt3p8kdF///bmxtvCW+twzNwd9TEhsbHYb4KFNNSOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QR6PqaXwHsCwlksQtwbHu2JiPGXEtXXg63ZBq8Y8F2yK6zmHeZ1Ze9mBX56anjLB1
	 /O1YLHeUJvLlKTgv843w9emTfr2Gi6UrmLsMP48ZeQ+LJ2H16CRZ0d7cW7MBqAsKsF
	 JwvcCcUzYmQGZDk77qcrMfTzokLb7Z56lGpjfFJbOFoXgoa8F07cQ3OXamFNZtm95d
	 pFrmIDRmWzmyvZfCKMzbDaICgnc/fwXQiLqZexqAUEeQSLVK+6TQSQx63VE5y8ds8q
	 oUMgx/FkFvU1NvMNsgYThEQ868T9mTi5lICadQ5SrC+zgS+mGNkCRlKNkHqY0AExNd
	 J5J1A5Dho9o5A==
Date: Wed, 15 Mar 2023 10:21:59 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v3 25/38] platform: add HAS_IOPORT dependencies
Message-ID: <ZBErx5zoE1tFlrhx@google.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
 <20230314121216.413434-26-schnelle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314121216.413434-26-schnelle@linux.ibm.com>

On Tue, Mar 14, 2023 at 01:12:03PM +0100, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
